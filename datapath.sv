import lc3b_types::*;

module datapath
(
	input clk,
	input lc3b_line mem_rdata,
	input logic mem_resp,
	output logic mem_read,
	output logic mem_write,
	output lc3b_c_line mem_wdata,
	output lc3b_wb_adr mem_address,
	output lc3b_word mem_sel,
	input lc3b_line ifetch_rdata,
	input logic ifetch_resp,
	output logic ifetch_read,
	output lc3b_wb_adr ifetch_address,
	
	output logic imm_mode,
	output logic jsr_mode,
	output logic [1:0] shf_mode,
	output lc3b_opcode opcode,
	
	input lc3b_control_word ctrl_in,
	input logic offset_sel,
	input logic sr2mux_sel,
	input logic destmux_sel,
	input logic is_ldb_stb,
	
	input logic [15:0] c10_out, c11_out, c12_out, c13_out, c14_out, c15_out,
	output logic c10_clear, c11_clear, c12_clear, c13_clear, c14_clear, c15_clear
);

logic stall_pipeline;
logic stall_pipeline_load;
//assign stall_pipeline = 1'b0;
lc3b_word memory_word_out;
lc3b_word alu_out_out_EX_MEM;
lc3b_word instruction_out_ID_EX;
lc3b_word instruction_out_EX_MEM;

/* PC */
lc3b_word pc;
lc3b_word pc_plus2_out;
lc3b_word addr_adder_out_out;
logic branch_enable;
logic branch_enable_out;
logic jump_enable;
logic jsr_enable;
logic trap_enable;
lc3b_word pcmux_out;
plus2 pc_plus2
(
	.stall_pipeline(1'b0),
	.in(pc),
	.out(pc_plus2_out)
);

logic [9:0] btb_index;
lc3b_word branch_prediction_out;
logic [9:0] branch_history_out;
logic branch_prediction;
lc3b_word branch_address_out;
lc3b_word pc_out_EX_MEM;
logic [9:0] branch_history_out_EX_MEM;
lc3b_word branch_address_out_EX_MEM;
logic branch_prediction_out_EX_MEM;
lc3b_word instruction;
logic is_j_out_EX_MEM;
logic is_jsr_out_EX_MEM;
logic is_trap_out_EX_MEM;
logic is_br_out_EX_MEM;

lc3b_word pc_plus2_out_EX_MEM;
lc3b_word pc_out_MEM_WB;
plus2 pc_plus2_EX_MEM
(
	.stall_pipeline(1'b0),
	.in(pc_out_EX_MEM),
	.out(pc_plus2_out_EX_MEM)
);

logic always_branch_out;
lc3b_word ifetch_word_out;
lc3b_word addr_adder_out_out_EX_MEM;
lc3b_word branch_prediction_address;
logic [7:0] branch_history;
logic prediction_made;
always_branch always_branch
(
	.clk,
	.pc(pc[8:1]),
	.instruction(lc3b_opcode'(ifetch_word_out[15:12])),
	.full_instruction(ifetch_word_out),
	.stall(stall_pipeline),
	.branch_prediction(always_branch_out),
	.branch_prediction_address(branch_prediction_address),
	.branch_history_out(branch_history_out),

	.pc_EX_MEM(pc_out_EX_MEM[8:1]),
	.br_address(addr_adder_out_out_EX_MEM),
	.jsr_address(addr_adder_out_out_EX_MEM),
	.jmp_address(alu_out_out_EX_MEM),
	.trap_address(memory_word_out),
	.branch_enable(branch_enable_out),
	.jmp_enable(jump_enable),
	.trap_enable(trap_enable),
	.jsr_enable(jsr_enable),
	.branched(jsr_enable || trap_enable || jump_enable || branch_enable_out),
	.instruction_EX_MEM(lc3b_opcode'(instruction_out_EX_MEM)),
	.branch_history_EX_MEM(branch_history_out_EX_MEM),
	.prediction_made(prediction_made)
);

mux2 #(.width(16)) branch_prediction_mux
(
	.sel(always_branch_out),
	.a(pc_plus2_out),
	.b(branch_prediction_address),
	.f(branch_prediction_out)
);

// 010 - jmp, jsrr
// 110 - jsr
// 001 - br
// default - pc + 2
// br = jsr = addr_adder_out_out_EX_MEM
// jmp = jsrr = alu_out_out_EX_MEM
logic [3:0] pcmux_sel;
logic flushed_out_3;
logic prediction_fail;
logic btb_fail;
assign pcmux_sel = {jsr_enable, jump_enable, branch_enable_out, trap_enable};
mux_decode_sel pcmux
(
	.sel(pcmux_sel),
	.a(branch_prediction_out),
	.b(addr_adder_out_out_EX_MEM),
	.c(alu_out_out_EX_MEM),
	.d(memory_word_out),
	.e(pc_out_EX_MEM),
	.btb_fail(btb_fail),
	.prediction_fail(prediction_fail),
	.f(pcmux_out)
);

logic [15:0] pht_fail_counter_out;
pht_counter pht_fail_counter
(
	.clk,
	.increment_count(prediction_fail),
	.clear(1'b0),
	.count_out(pht_fail_counter_out)
);

logic [15:0] prediction_made_counter_out;
pht_counter prediction_made_counter
(
	.clk,
	.increment_count(prediction_made),
	.clear(1'b0),
	.count_out(prediction_made_counter_out)
);

register program_counter
(
	.clk,
	.load(!stall_pipeline && !stall_pipeline_load),
	.in(pcmux_out),
	.out(pc)
);
assign ifetch_address = pc[15:4];
assign ifetch_read = 1'b1;

line_to_word ifetch_line_to_word
(
	.in(ifetch_rdata),
	.offset(pc[3:0]),
	.out(ifetch_word_out)
);

// >>>>> IF/ID PIPELINE <<<<< //
logic [9:0] branch_history_out_IF_ID;
logic branch_prediction_out_IF_ID;
lc3b_word branch_address_out_IF_ID;
lc3b_word pc_out_IF_ID;
IF_ID_pipeline IF_ID_pipeline
(
	.clk,
	.instruction_in(ifetch_word_out),
	.instruction_out(instruction),
	.stall_pipeline(stall_pipeline || stall_pipeline_load),
	.branch_history_in(branch_history_out),
	.branch_history_out(branch_history_out_IF_ID),
	.branch_prediction_in(always_branch_out),
	.branch_prediction_out(branch_prediction_out_IF_ID),
	.branch_address_in(branch_prediction_address),
	.branch_address_out(branch_address_out_IF_ID),
	.pc_in(pc_plus2_out),
	.pc_out(pc_out_IF_ID)
);
// >>>>> IF/ID PIPELINE <<<<< //
assign imm_mode = instruction[5];
assign jsr_mode = instruction[11];
assign shf_mode = instruction[5:4];
assign opcode = lc3b_opcode'(instruction[15:12]);
lc3b_reg mem_wb_dest;
lc3b_word sr1;
lc3b_word sr2_r;
lc3b_word sr1_ID_EX;
lc3b_word sr2_r_ID_EX;
lc3b_word sr_out;
lc3b_word regfilemux_out_MEM_WB;
logic load_regfile;
lc3b_opcode operation_out_EX_MEM;
stall_unit_2 stall_unit_2
(
	.clk,
	.instruction_curr(instruction_out_ID_EX),
	.instruction_last(instruction_out_EX_MEM),
	.flushed(flushed_out_3),
	.stall_pipeline_load(stall_pipeline_load)
	//output logic sti_write
);

regfile regfile
(
    .clk,
    .load(load_regfile),
    .in(regfilemux_out_MEM_WB),
    .src_a(instruction[8:6]),
	 .src_b(instruction[2:0]),
	 .sr(instruction[11:9]),
	 .dest(mem_wb_dest),
    .reg_a(sr1),
	 .reg_b(sr2_r),
	 .sr_out(sr_out),
	 .src_a_ID_EX(instruction_out_ID_EX[8:6]),
	 .src_b_ID_EX(instruction_out_ID_EX[2:0]),
	 .reg_a_ID_EX(sr1_ID_EX),
	 .reg_b_ID_EX(sr2_r_ID_EX)
);

lc3b_word sext5_out;
/* addi, andi */
sext5 sext5
(
	.in(instruction[4:0]),
	.out(sext5_out)
);

/* Select register mode or immediate mode */
lc3b_word sr2;
mux2 sr2mux
(
	.sel(sr2mux_sel),
	.a(sr2_r),
	.b(sext5_out),
	.f(sr2)
);

/* For jsr */
lc3b_reg destmux_out;
mux2 #(.width(3)) destmux
(
	.sel(destmux_sel),
	.a(instruction[11:9]),
	.b(3'b111),
	.f(destmux_out)
);

/* str, stb, ldr, ldb */
lc3b_word adj6_out;
adj #(.width(6)) adj6
(
    .in(instruction[5:0]),
    .out(adj6_out)
);

lc3b_word sext6_out;
/* stb, ldb */
sext5 #(.width(6)) sext6
(
	 .in(instruction[5:0]),
	 .out(sext6_out)
);

lc3b_word offset6_in;
mux2 offset6mux
(
	.sel(is_ldb_stb),
	.a(adj6_out),
	.b(sext6_out),
	.f(offset6_in)
);

/* br */
lc3b_word adj9_out;
adj #(.width(9)) adj9
(
    .in(instruction[8:0]),
    .out(adj9_out)
);

/* jsr */
lc3b_word adj11_out;
adj #(.width(11)) adj11
(
    .in(instruction[10:0]),
    .out(adj11_out)
);

lc3b_word offset_out;
mux2 offset
(
    .sel(offset_sel),
	 .a(adj9_out),
	 .b(adj11_out),
	 .f(offset_out)
);

lc3b_word trapvector_in;
zext zext8
(
	 .in(instruction[7:0]),
	 .out(trapvector_in)
);

lc3b_word shifted_trapvector_in;
assign shifted_trapvector_in = (trapvector_in << 1);

// >>>>> ID/EX PIPELINE <<<<< //
lc3b_control_word ctrl_out_ID_EX;
lc3b_word sr1_out;
lc3b_word sr2_out;
lc3b_word offset6_out;
lc3b_word branch_offset_out;
lc3b_nzp nzp_out_ID_EX;
lc3b_reg dest_out_ID_EX;
lc3b_word pc_out_ID_EX;
lc3b_word dest_data_out_ID_EX;
lc3b_word trapvector_out_ID_EX;
lc3b_imm4 shift_out;
lc3b_reg sr1_reg_ID_EX;
lc3b_reg sr2_reg_ID_EX;
logic is_ldb_stb_ID_EX;
lc3b_opcode operation_out_ID_EX;
logic imm_mode_out;
logic sr2mux_sel_out;
lc3b_word sext5_out_out;
logic [9:0] branch_history_out_ID_EX;
logic branch_prediction_out_ID_EX;
lc3b_word branch_address_out_ID_EX;
ID_EX_pipeline ID_EX_pipeline
(
	.clk,
	.ctrl_in(ctrl_in),
	.sr1_in(sr1),
	.sr2_in(sr2),
	.offset6_in(offset6_in),
	.branch_offset_in(offset_out),
	.nzp_in(instruction[11:9]),
	.dest_in(destmux_out),
	.pc_in(pc_out_IF_ID),
	.dest_data_in(sr_out),
	.trapvector_in(shifted_trapvector_in),
	.shift_in(instruction[3:0]),
	.is_ldb_stb_in(is_ldb_stb),
	.sr1_reg_in(instruction[8:6]),
	.sr2_reg_in(instruction[2:0]),
	.operation_in(lc3b_opcode'(instruction[15:12])),
	.instruction_in(instruction),
	.imm_mode_in(imm_mode),
	.sr2mux_sel_in(sr2mux_sel),
	.sext5_out_in(sext5_out),
	
	.ctrl_out(ctrl_out_ID_EX),
	.sr1_out(sr1_out),
	.sr2_out(sr2_out),
	.offset6_out(offset6_out),
	.branch_offset_out(branch_offset_out),
	.nzp_out(nzp_out_ID_EX),
	.dest_out(dest_out_ID_EX),
	.pc_out(pc_out_ID_EX),
	.dest_data_out(dest_data_out_ID_EX),
	.trapvector_out(trapvector_out_ID_EX),
	.shift_out(shift_out),
	.is_ldb_stb_out(is_ldb_stb_ID_EX),
	.sr1_reg_out(sr1_reg_ID_EX),
	.sr2_reg_out(sr2_reg_ID_EX),	
	.operation_out(operation_out_ID_EX),
	.instruction_out(instruction_out_ID_EX),
	.stall_pipeline(stall_pipeline || stall_pipeline_load),
	.imm_mode_out(imm_mode_out),
	.sr2mux_sel_out(sr2mux_sel_out),
	.sext5_out_out(sext5_out_out),
	
	.branch_history_in(branch_history_out_IF_ID),
	.branch_history_out(branch_history_out_ID_EX),
	.branch_prediction_in(branch_prediction_out_IF_ID),
	.branch_prediction_out(branch_prediction_out_ID_EX),
	.branch_address_in(branch_address_out_IF_ID),
	.branch_address_out(branch_address_out_ID_EX)	
);
// >>>>> ID/EX PIPELINE <<<<< //

lc3b_word sr2_ID_EX_out;
mux2 immmux
(
	.sel(sr2mux_sel_out),
	.a(sr2_r_ID_EX),
	.b(sext5_out_out),
	.f(sr2_ID_EX_out)
);

lc3b_word alumux_out;
mux4 alumux
(
	.sel(ctrl_out_ID_EX.alumux_sel),
	.a(sr2_ID_EX_out),
	.b(offset6_out),
	.c(branch_offset_out),
	.d({12'h000, shift_out}),
	.f(alumux_out)	 
);

logic [1:0] forwarding_unit_1_out;
logic load_regfile_EX_MEM;
lc3b_reg dest_out_EX_MEM;
forwarding_unit forwarding_unit_1
(
	.regwrite_EX(load_regfile_EX_MEM),
	.regwrite_MEM(load_regfile),
	.register_num(sr1_reg_ID_EX),
	.operation(operation_out_ID_EX),	
	.destreg_EX(dest_out_EX_MEM),
	.destreg_MEM(mem_wb_dest),
	.forwarding_unit_out(forwarding_unit_1_out),
	.is_jssr(instruction_out_ID_EX[11])
);

logic [1:0] forwarding_unit_2_out;
logic [3:0] testvalue;
forwarding_unit_2 forwarding_unit_2
(
	.regwrite_EX(load_regfile_EX_MEM),	
	.regwrite_MEM(load_regfile),	
	.register_num(sr2_reg_ID_EX),
	.operation(operation_out_ID_EX),
	.destreg_EX(dest_out_EX_MEM),
	.destreg_MEM(mem_wb_dest),
	.imm_mode(imm_mode_out),
	.forwarding_unit_out(forwarding_unit_2_out),
	.test(testvalue)
);
logic [1:0] forwarding_unit_3_out;
forwarding_unit_3 forwarding_unit_3
(
	.regwrite_EX(load_regfile_EX_MEM),
	.regwrite_MEM(load_regfile),
	.register_num(dest_out_ID_EX),
	.operation(operation_out_ID_EX),	
	.destreg_EX(dest_out_EX_MEM),
	.destreg_MEM(mem_wb_dest),
	.forwarding_unit_out(forwarding_unit_3_out)
);

lc3b_word sr1mux_out;
lc3b_word sr2_mux_out;
lc3b_word regfilemux_out_pre_counter;
lc3b_word regfilemux_out;
lc3b_word storemux_out;

logic [1:0] forwarding_mask;
mux4 sr1mux
(
	.sel(forwarding_unit_1_out & forwarding_mask),
	.a(sr1_ID_EX),
	.b(regfilemux_out_MEM_WB),	
	.c(regfilemux_out),
	.d(sr1_out),
	.f(sr1mux_out)
);
logic [1:0] forwarding_mask_2;
mux4 sr2_mux
(
	.sel(forwarding_unit_2_out & forwarding_mask),
	.a(alumux_out),
	.b(regfilemux_out_MEM_WB),
	.c(regfilemux_out),
	.d(alumux_out),
	.f(sr2_mux_out)
);

mux4 storemux
(
	.sel(forwarding_unit_3_out & forwarding_mask),
	.a(dest_data_out_ID_EX),
	.b(regfilemux_out_MEM_WB),	
	.c(regfilemux_out),
	.d(dest_data_out_ID_EX),
	.f(storemux_out)
);

lc3b_word alu_out;
alu alu
(
	.aluop(ctrl_out_ID_EX.aluop),
	.a(sr1mux_out),
	.b(sr2_mux_out),
	.f(alu_out)
);

lc3b_word addr_adder_out;
badder addr_adder
(
	.a(pc_out_ID_EX),
	.b(branch_offset_out),
	.f(addr_adder_out)
);

logic load_cc_ID_EX;
logic load_regfile_ID_EX;
logic mem_read_ID_EX;
logic mem_write_ID_EX;
logic [2:0] regfilemux_sel_ID_EX;
logic is_br_out_ID_EX;
logic is_j_out_ID_EX;
logic is_jsr_out_ID_EX;
logic is_trap_out_ID_EX;
logic [1:0] addr_sel_ID_EX;
logic [1:0] mem_byte_enable_ID_EX;
logic is_ldi_ID_EX;
logic is_sti_ID_EX;
assign load_cc_ID_EX = ctrl_out_ID_EX.load_cc;
assign load_regfile_ID_EX = ctrl_out_ID_EX.load_regfile;
assign mem_read_ID_EX = ctrl_out_ID_EX.mem_read;
assign mem_write_ID_EX = ctrl_out_ID_EX.mem_write;
assign regfilemux_sel_ID_EX = ctrl_out_ID_EX.regfilemux_sel;
assign is_br_out_ID_EX = ctrl_out_ID_EX.is_br;
assign is_j_out_ID_EX = ctrl_out_ID_EX.is_j;
assign is_jsr_out_ID_EX = ctrl_out_ID_EX.is_jsr;
assign is_trap_out_ID_EX = ctrl_out_ID_EX.is_trap;
assign addr_sel_ID_EX = ctrl_out_ID_EX.addr_sel;
assign mem_byte_enable_ID_EX = ctrl_out_ID_EX.mem_byte_enable;
assign is_ldi_ID_EX = ctrl_out_ID_EX.is_ldi;
assign is_sti_ID_EX = ctrl_out_ID_EX.is_sti;

// >>>>> EX/MEM PIPELINE <<<<< //
lc3b_nzp nzp_out_EX_MEM;
logic load_cc_EX_MEM;
logic mem_read_EX_MEM;
logic mem_write_EX_MEM;
logic [2:0] regfilemux_sel_EX_MEM;
lc3b_word dest_data_out_EX_MEM;

lc3b_word trapvector_out_EX_MEM;
logic [1:0] addr_sel_EX_MEM;
logic [1:0] mem_byte_enable_EX_MEM;
logic is_ldi_EX_MEM;
logic is_sti_EX_MEM;
logic is_ldb_stb_EX_MEM;
lc3b_control_word ctrl_out_EX_MEM;

EX_MEM_pipeline EX_MEM_pipeline
(
	.clk,
	.alu_out_in(alu_out),
	.addr_adder_out_in(addr_adder_out),
	.pc_in(pc_out_ID_EX),
	.dest_in(dest_out_ID_EX),
	.nzp_in(nzp_out_ID_EX),
	.is_br_in(is_br_out_ID_EX),
	.is_j_in(is_j_out_ID_EX),
	.is_jsr_in(is_jsr_out_ID_EX),
	.is_trap_in(is_trap_out_ID_EX),
	.load_cc_in(load_cc_ID_EX),
	.load_regfile_in(load_regfile_ID_EX),
	.mem_read_in(mem_read_ID_EX),
	.mem_write_in(mem_write_ID_EX),
	.regfilemux_sel_in(regfilemux_sel_ID_EX),
	.dest_data_in(storemux_out),
	.trapvector_in(trapvector_out_ID_EX),
	.addr_sel_in(addr_sel_ID_EX),
	.mem_byte_enable_in(mem_byte_enable_ID_EX),
	.is_ldi_in(is_ldi_ID_EX),
	.is_sti_in(is_sti_ID_EX),
	.is_ldb_stb_in(is_ldb_stb_ID_EX),
	.ctrl_in(ctrl_out_ID_EX),
	.operation_in(operation_out_ID_EX),
	.instruction_in(instruction_out_ID_EX),
	.instruction_out(instruction_out_EX_MEM),
	.alu_out_out(alu_out_out_EX_MEM),
	.addr_adder_out_out(addr_adder_out_out_EX_MEM),
	.pc_out(pc_out_EX_MEM),
	.dest_out(dest_out_EX_MEM),
	.nzp_out(nzp_out_EX_MEM),
	.is_br_out(is_br_out_EX_MEM),
	.is_j_out(is_j_out_EX_MEM),
	.load_cc_out(load_cc_EX_MEM),
	.load_regfile_out(load_regfile_EX_MEM),
	.mem_read_out(mem_read_EX_MEM),
	.mem_write_out(mem_write_EX_MEM),
	.regfilemux_sel_out(regfilemux_sel_EX_MEM),
	.dest_data_out(dest_data_out_EX_MEM),
	.is_jsr_out(is_jsr_out_EX_MEM),
	.is_trap_out(is_trap_out_EX_MEM),
	.trapvector_out(trapvector_out_EX_MEM),
	.addr_sel_out(addr_sel_EX_MEM),
	.mem_byte_enable_out(mem_byte_enable_EX_MEM),
	.stall_pipeline(stall_pipeline || stall_pipeline_load),
	.is_ldi_out(is_ldi_EX_MEM),
	.is_sti_out(is_sti_EX_MEM),
	.is_ldb_stb_out(is_ldb_stb_EX_MEM),
	.ctrl_out(ctrl_out_EX_MEM),
	.operation_out(operation_out_EX_MEM),
	
	.branch_history_in(branch_history_out_ID_EX),
	.branch_history_out(branch_history_out_EX_MEM),
	.branch_prediction_in(branch_prediction_out_ID_EX),
	.branch_prediction_out(branch_prediction_out_EX_MEM),
	.branch_address_in(branch_address_out_ID_EX),
	.branch_address_out(branch_address_out_EX_MEM)		
);
// >>>>> EX/MEM PIPELINE <<<<< //
lc3b_wb_adr mem_address_mux_out;
mux2 #(.width (12)) mem_address_mux
(
	.sel(addr_sel_EX_MEM[0]),
	.a(alu_out_out_EX_MEM[15:4]),
	.b(trapvector_out_EX_MEM[15:4]),
	.f(mem_address_mux_out)
);

//assign mem_read = mem_read_EX_MEM;
//assign mem_write = mem_write_EX_MEM;
//assign mem_address = mem_address_mux_out;

logic [2:0] regfilesel_out;
logic [1:0] mem_byte_enable;
ldbstblogic ldbstblogic
(
	.is_ldb_stb_in(is_ldb_stb_EX_MEM),
	.regfilesel_in(regfilemux_sel_EX_MEM),
	.mem_byte_enable_in(mem_byte_enable_EX_MEM),
	.store_byte(alu_out_out_EX_MEM[0]),
	.regfilesel_out(regfilesel_out),
	.mem_byte_enable_out(mem_byte_enable)
);

logic [3:0] line_offset_mux_out;
mux2 #(.width (4)) line_offset_mux
(
	.sel(addr_sel_EX_MEM[0]),
	.a(alu_out_out_EX_MEM[3:0]),
	.b(trapvector_out_EX_MEM[3:0]),
	.f(line_offset_mux_out)
);

logic [3:0] line_offset;
logic mem_write_out;
logic mem_read_out;
logic mem_read_bp;
logic mem_write_bp;
logic accessing_counter;
stall_unit stall_unit
(
	.clk,
	.mem_read_in(mem_read_out),
	.mem_write_in(mem_write_out),
	.mem_resp(mem_resp || accessing_counter),
	.ifetch_resp(ifetch_resp),
	.is_sti(is_sti_EX_MEM),
	.is_ldi(is_ldi_EX_MEM),
	.mem_address_in(mem_address_mux_out),
	.mem_rdata(memory_word_out),
	.line_offset_in(line_offset_mux_out),
	//.sti_write(sti_write),
	.mem_read(mem_read_bp),
	.mem_write(mem_write_bp),
	.mem_address(mem_address),
	.stall_pipeline(stall_pipeline),
	.line_offset_out(line_offset),
	.flushed(flushed_out_3)
);

line_to_word memory_line_to_word
(
	.in(mem_rdata),
	.offset(line_offset),
	.out(memory_word_out)
);

set_sel set_sel
(
	.mem_wdata_word(dest_data_out_EX_MEM),
	.offset(line_offset),
	.mem_byte_enable(mem_byte_enable),
	.out(mem_wdata),
	.mem_sel(mem_sel)
);
logic clear_counter_out;
logic [15:0] counter_mux_out;
logic memory_counter_sel;
//Counter wires
logic c0_clear;
logic [15:0] c0_out;

mux8 regfilemux
(
    .sel(regfilesel_out),
    .a(alu_out_out_EX_MEM),
	 .b(memory_word_out),
	 .c(pc_out_EX_MEM),
	 .d(addr_adder_out_out_EX_MEM),
	 .e(memory_word_out & 16'h00FF),
	 .f(memory_word_out >> 8),
	 .g(16'b0),
	 .h(16'b0),
    .out(regfilemux_out_pre_counter)
);
mux2 memory_counter_mux
(
	.sel(memory_counter_sel),
	.a(regfilemux_out_pre_counter),
	.b(counter_mux_out),
	.f(regfilemux_out)

);

/* CC... Either here or after MEM/WB */
lc3b_nzp gencc_out;
gencc the_gencc
(
	.in(regfilemux_out),
	.out(gencc_out)
);

lc3b_nzp cc_out;
logic cc_enable;
register #(.width (3)) cc
(
	.clk,
	.load(cc_enable),
	.in(gencc_out),
	.out(cc_out)
);

logic branch_unit_out;
branch_unit cccomp
(
	.input_condition(cc_out),
	.branch_condition(nzp_out_EX_MEM),
	.branch(branch_unit_out)
);

assign branch_enable = is_br_out_EX_MEM & branch_unit_out & (instruction_out_EX_MEM != 4'h0000);
//assign jump_enable = is_j_out_EX_MEM;
//assign jsr_enable = is_jsr_out_EX_MEM;
//assign trap_enable = is_trap_out_EX_MEM;

logic load_regfile_out;
static_branch_prediction flush
(
	.clk,
	.load_cc_in(load_cc_EX_MEM),
	.load_cc_out(cc_enable),
	.forwarding_mask(forwarding_mask),
	.branch_enable(branch_enable),
	.unconditional_branch(jump_enable || jsr_enable || trap_enable),
	.load_regfile(load_regfile_EX_MEM),
	.stall(stall_pipeline),
	.mem_write_in(mem_write_EX_MEM),
	.load_regfile_out(load_regfile_out),
	.mem_write_out(mem_write_out),
	.mem_read_in(mem_read_EX_MEM),
	.mem_read_out(mem_read_out),
	.branch_enable_out(branch_enable_out),
	.is_load(operation_out_EX_MEM),
	.is_j_in(is_j_out_EX_MEM),
	.is_j_out(jump_enable),
	.is_jsr_in(is_jsr_out_EX_MEM),
	.is_jsr_out(jsr_enable),
	.is_trap_in(is_trap_out_EX_MEM),
	.is_trap_out(trap_enable),

	.br_address(addr_adder_out_out_EX_MEM),
	.jsr_address(addr_adder_out_out_EX_MEM),
	.jmp_address(alu_out_out_EX_MEM),
	.trap_address(memory_word_out),
	.branch_prediction_address(branch_address_out_EX_MEM),
	.branch_prediction(branch_prediction_out_EX_MEM),
	.prediction_fail(prediction_fail),
	.instruction(instruction_out_EX_MEM),
	.btb_fail(btb_fail),
	
	.flushed(flushed_out_3)
);

assign mem_read = mem_read_bp && !accessing_counter;
assign mem_write = mem_write_bp && !accessing_counter;


counter_control counter_control
(
	.is_read(mem_read_bp),
	.is_write(mem_write_bp),
	.addr(mem_address),
	.clear_counter(clear_counter_out),
	.counter_out_sel(memory_counter_sel),
	.accessing_counter(accessing_counter)
);

/* c10 = dcache hit
	c11 = dcache miss
	c12 = icache hit
	c13 = icache miss
	c4 = l2 hit
	c5 = l2 miss */
counter_decoder counter_decoder
(
	.clear_counter(clear_counter_out),
	.offset(line_offset),
	.c0(c0_clear),
	.c1(),
	.c2(),
	.c3(), .c4(), .c5(),.c6(),.c7(),.c8(),.c9(),.c10(c10_clear),.c11(c11_clear),.c12(c12_clear),.c13(c13_clear),.c14(c14_clear),.c15(c15_clear)
);

mux16 counter_value_mux
(
	.sel(line_offset),
	.a(c0_out),
	
	.k(c10_out),
	.l(c11_out),
	.m(c12_out),
	.n(c13_out),
	.o(c14_out),
	.p(c15_out),
	.out(counter_mux_out)
);


// >>>>> MEM/WB PIPELINE <<<<< //
lc3b_control_word ctrl_out_MEM_WB;
lc3b_opcode operation_out_MEM_WB;
lc3b_word instruction_out_MEM_WB;
MEM_WB_pipeline MEM_WB_pipeline
(
	.clk,
	.dest_in(dest_out_EX_MEM),
	.regfilemux_out_in(regfilemux_out),
	.load_regfile_in(load_regfile_out),
	.ctrl_in(ctrl_out_EX_MEM),
	.dest_out(mem_wb_dest),
	.regfilemux_out_out(regfilemux_out_MEM_WB),
	.load_regfile_out(load_regfile),
	.ctrl_out(ctrl_out_MEM_WB),
	.stall_pipeline(stall_pipeline),
	.operation_in(operation_out_EX_MEM),
	.operation_out(operation_out_MEM_WB),
	.instruction_in(instruction_out_EX_MEM),
	.instruction_out(instruction_out_MEM_WB),
	.pc_in(pc_out_EX_MEM),
	.pc_out(pc_out_MEM_WB)
);
// >>>>> MEM/WB PIPELINE <<<<< //

// >>>>> COUNTERS <<<<< //



counter_rising_edge counter_stalls_memory
(
	.clk,
	.increment_count(stall_pipeline),
	.clear(c0_clear),
	.count_out(c0_out)
);

counter_rising_edge counter_stalls_hazard
(
	.clk,
	.increment_count(stall_pipeline_load),
	.clear(0),
	.count_out()
);
endmodule : datapath
