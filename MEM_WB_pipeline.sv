import lc3b_types::*;

module MEM_WB_pipeline
(
	input clk,
	input lc3b_reg dest_in,
	input lc3b_word regfilemux_out_in,
	input logic load_regfile_in,
	input lc3b_control_word ctrl_in,
	//input lc3b_word alu_out_in,
	//input lc3b_word mem_rdata_in,
	//input lc3b_word pc_in,
	input lc3b_opcode operation_in,
	
	output lc3b_reg dest_out,
	output lc3b_word regfilemux_out_out,
	output logic load_regfile_out,
	output lc3b_control_word ctrl_out,
	//output lc3b_word alu_out_out,
	//output lc3b_word mem_rdata_out,
	//output lc3b_word pc_out
	output lc3b_opcode operation_out,	
	input logic stall_pipeline,
	input lc3b_word instruction_in,
	output lc3b_word instruction_out	
);

lc3b_reg dest;
lc3b_word alu_out;
lc3b_word mem_rdata;
lc3b_word pc;
lc3b_word regfilemux_out;
lc3b_control_word ctrl;
logic load_regfile;
lc3b_opcode operation;
lc3b_word instruction;

always_ff @(posedge clk)
begin
	if(stall_pipeline == 0) begin
		dest <= dest_in;
		//alu_out <= alu_out_in;
		//mem_rdata <= mem_rdata_in;
		//pc <= pc_in;
		regfilemux_out <= regfilemux_out_in;
		load_regfile <= load_regfile_in;
		ctrl <= ctrl_in;
		operation <= operation_in;
		instruction <= instruction_in;
	end
end

always_comb
begin
	dest_out = dest;
	//alu_out_out = alu_out;
	//mem_rdata_out = mem_rdata;
	//pc_out = pc;
	regfilemux_out_out = regfilemux_out;	
	load_regfile_out = load_regfile;
	ctrl_out = ctrl;
	operation_out = operation;	
	instruction_out = instruction;
end
endmodule : MEM_WB_pipeline