import lc3b_types::*;


module EX_MEM_pipeline
(
	input clk,
	input mem_resp,
	//input logic is_j_in,
	//input logic is_br_in,
	//input logic branch_enable_in,
	input lc3b_word alu_out_in,
	input lc3b_word addr_adder_out_in,
	//input lc3b_word trap_addr_in,
	input lc3b_word pc_in,
	input lc3b_reg dest_in,
	input lc3b_nzp nzp_in,
	input logic is_br_in,
	input logic load_cc_in,
	input logic load_regfile_in,
	input logic mem_read_in,
	input logic mem_write_in,
	input logic [1:0] regfilemux_sel_in,
	input lc3b_word dest_data_in,
	
	//output logic is_j_out,
	//output logic is_br_in,
	//output logic branch_enable_out,
	output lc3b_word alu_out_out,
	output lc3b_word addr_adder_out_out,
	//output lc3b_word trap_addr_out,
	output lc3b_word pc_out,
	output lc3b_reg dest_out,
	output lc3b_nzp nzp_out,
	output logic is_br_out,
	output logic load_cc_out,
	output logic load_regfile_out,
	output logic mem_read_out,
	output logic mem_write_out,
	output logic [1:0] regfilemux_sel_out,
	output lc3b_word dest_data_out
);

//logic is_j;
logic is_br;
//logic branch_enable;
lc3b_word alu_out;
lc3b_word addr_adder_out;
//lc3b_word trap_addr;
lc3b_word pc;
lc3b_reg dest;
lc3b_nzp nzp;
logic load_cc;
logic load_regfile;
logic mem_read;
logic mem_write;
logic [1:0] regfilemux_sel;
lc3b_word dest_data;

always_ff @(posedge clk)
begin
	if(mem_resp) begin
		//is_j <= is_j_in;
		is_br <= is_br_in;
		//branch_enable <= branch_enable_in;
		alu_out <= alu_out_in;
		addr_adder_out <= addr_adder_out_in;
		//trap_addr <= trap_addr_in;
		pc <= pc_in;
		dest <= dest_in;
		nzp <= nzp_in;
		is_br <= is_br_in;
		load_cc <= load_cc_in;
		load_regfile <= load_regfile_in;
		mem_read <= mem_read_in;
		mem_write <= mem_write_in;
		regfilemux_sel <= regfilemux_sel_in;
		dest_data <= dest_data_in;
	end
end

always_comb
begin
	//is_j_out = is_j;
	is_br_out = is_br;
	//branch_enable_out = branch_enable;
	alu_out_out = alu_out;
	addr_adder_out_out = addr_adder_out;
	//trap_addr_out = trap_addr;
	pc_out = pc;
	dest_out = dest;
	nzp_out = nzp;
	is_br_out = is_br;
	load_cc_out = load_cc;
	load_regfile_out = load_regfile;
	mem_read_out = mem_read;
	mem_write_out = mem_write;
	regfilemux_sel_out = regfilemux_sel;
	dest_data_out = dest_data;
end
endmodule : EX_MEM_pipeline