import lc3b_types::*;

module datapath
(
	input clk,
	input lc3b_line mem_rdata,
	input logic mem_resp,
	output logic mem_read,
	output logic mem_write,
	output lc3b_word mem_wdata,
	output lc3b_word mem_address,
	output logic [1:0] mem_byte_enable,
	input lc3b_line ifetch_rdata,
	input logic ifetch_resp,
	output logic ifetch_read,
	output lc3b_word ifetch_address,
	
	output logic imm_mode,
	output lc3b_opcode opcode,
	input lc3b_control_word ctrl_in,
	input logic offset_sel,
	input logic sr2mux_sel
);

assign mem_byte_enable = 2'b00;

/* PC */
lc3b_word pc;
lc3b_word pc_plus2_out;
lc3b_word addr_adder_out_out;
logic branch_enable;
lc3b_word pcmux_out;
plus2 pc_plus2
(
	.in(pc),
	.out(pc_plus2_out)
);

mux2 pcmux
(
	.sel(branch_enable),
	.a(pc_plus2_out),
	.b(addr_adder_out_out),
	.f(pcmux_out)
);

register program_counter
(
	.clk,
	.load(1'b1),
	.in(pcmux_out),
	.out(pc)
);
assign ifetch_address = pc;
assign ifetch_read = 1'b1;
// >>>>> IF/ID PIPELINE <<<<< //
lc3b_word instruction;
IF_ID_pipeline IF_ID_pipeline
(
	.clk,
	.instruction_in(ifetch_rdata[15:0]),
	.instruction_out(instruction)
);
// >>>>> IF/ID PIPELINE <<<<< //
assign imm_mode = instruction[5];
assign opcode = lc3b_opcode'(instruction[15:12]);
lc3b_reg mem_wb_dest;
lc3b_word sr1;
lc3b_word sr2_r;
lc3b_word sr_out;
lc3b_word regfilemux_out_MEM_WB;
logic load_regfile;
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
	 .sr_out(sr_out)
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

/* br */
lc3b_word adj9_out;
adj #(.width(9)) adj9
(
    .in(instruction[8:0]),
    .out(adj9_out)
);

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
ID_EX_pipeline ID_EX_pipeline
(
	.clk,
	.ctrl_in(ctrl_in),
	.sr1_in(sr1),
	.sr2_in(sr2),
	.offset6_in(adj6_out),
	.branch_offset_in(adj9_out),
	.nzp_in(instruction[11:9]),
	.dest_in(instruction[11:9]),
	.pc_in(pc),
	.dest_data_in(sr_out),
	
	.ctrl_out(ctrl_out_ID_EX),
	.sr1_out(sr1_out),
	.sr2_out(sr2_out),
	.offset6_out(offset6_out),
	.branch_offset_out(branch_offset_out),
	.nzp_out(nzp_out_ID_EX),
	.dest_out(dest_out_ID_EX),
	.pc_out(pc_out_ID_EX),
	.dest_data_out(dest_data_out_ID_EX)
);
// >>>>> ID/EX PIPELINE <<<<< //

lc3b_word alumux_out;
mux4 alumux
(
	.sel(ctrl_out_ID_EX.alumux_sel),
	.a(sr2_out),
	.b(offset6_out),
	.c(branch_offset_out),
	.d(16'h0000),
	.f(alumux_out)	 
);

lc3b_word alu_out;
alu alu
(
	.aluop(ctrl_out_ID_EX.aluop),
	.a(sr1_out),
	.b(alumux_out),
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
logic [1:0] regfilemux_sel_ID_EX;
logic is_br_out_ID_EX;
assign load_cc_ID_EX = ctrl_out_ID_EX.load_cc;
assign load_regfile_ID_EX = ctrl_out_ID_EX.load_regfile;
assign mem_read_ID_EX = ctrl_out_ID_EX.mem_read;
assign mem_write_ID_EX = ctrl_out_ID_EX.mem_write;
assign regfilemux_sel_ID_EX = ctrl_out_ID_EX.regfilemux_sel;
assign is_br_out_ID_EX = ctrl_out_ID_EX.is_br;

// >>>>> EX/MEM PIPELINE <<<<< //
lc3b_word pc_out_EX_MEM;
lc3b_word addr_adder_out_out_EX_MEM;
lc3b_word dest_out_EX_MEM;
lc3b_word alu_out_out_EX_MEM;
lc3b_nzp nzp_out_EX_MEM;
logic is_br_out_EX_MEM;
logic load_cc_EX_MEM;
logic load_regfile_EX_MEM;
logic mem_read_EX_MEM;
logic mem_write_EX_MEM;
logic [1:0] regfilemux_sel_EX_MEM;
lc3b_word dest_data_out_EX_MEM;
EX_MEM_pipeline EX_MEM_pipeline
(
	.clk,
	.alu_out_in(alu_out),
	.addr_adder_out_in(addr_adder_out),
	.pc_in(pc_out_ID_EX),
	.dest_in(dest_out_ID_EX),
	.nzp_in(nzp_out_ID_EX),
	.is_br_in(is_br_out_ID_EX),
	.load_cc_in(load_cc_ID_EX),
	.load_regfile_in(load_regfile_ID_EX),
	.mem_read_in(mem_read_ID_EX),
	.mem_write_in(mem_write_ID_EX),
	.regfilemux_sel_in(regfilemux_sel_ID_EX),
	.dest_data_in(dest_data_out_ID_EX),
	
	.alu_out_out(alu_out_out_EX_MEM),
	.addr_adder_out_out(addr_adder_out_out_EX_MEM),
	.pc_out(pc_out_EX_MEM),
	.dest_out(dest_out_EX_MEM),
	.nzp_out(nzp_out_EX_MEM),
	.is_br_out(is_br_out_EX_MEM),
	.load_cc_out(load_cc_EX_MEM),
	.load_regfile_out(load_regfile_EX_MEM),
	.mem_read_out(mem_read_EX_MEM),
	.mem_write_out(mem_write_EX_MEM),
	.regfilemux_sel_out(regfilemux_sel_EX_MEM),
	.dest_data_out(dest_data_out_EX_MEM)
);
// >>>>> EX/MEM PIPELINE <<<<< //

assign mem_read = mem_read_EX_MEM;
assign mem_write = mem_write_EX_MEM;
assign mem_address = alu_out_out_EX_MEM;
assign mem_wdata = dest_data_out_EX_MEM;

lc3b_word regfilemux_out;
mux4 regfilemux
(
    .sel(regfilemux_sel_EX_MEM),
    .a(alu_out_out_EX_MEM),
	 .b(mem_rdata[15:0]),
	 .c(pc_out_EX_MEM),
	 .d(16'h0000),
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
register #(.width (3)) cc
(
	.clk,
	.load(load_cc_EX_MEM),
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

assign branch_enable = is_br_out_EX_MEM & branch_unit_out;

// >>>>> MEM/WB PIPELINE <<<<< //
MEM_WB_pipeline MEM_WB_pipeline
(
	.clk,
	.dest_in(dest_out_EX_MEM),
	.regfilemux_out_in(regfilemux_out),
	.load_regfile_in(load_regfile_EX_MEM),
	.dest_out(mem_wb_dest),
	.regfilemux_out_out(regfilemux_out_MEM_WB),
	.load_regfile_out(load_regfile)
);
// >>>>> MEM/WB PIPELINE <<<<< //


endmodule : datapath
