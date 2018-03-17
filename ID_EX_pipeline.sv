import lc3b_types::*;

module ID_EX_pipeline
(
	input clk,
	input lc3b_control_word ctrl_in,
	input lc3b_word sr1_in,
	input lc3b_word sr2_in,
	input lc3b_word offset6_in,
	input lc3b_word branch_offset_in,
	input lc3b_nzp nzp_in,
	input lc3b_reg dest_in,
	input lc3b_word pc_in,
	input lc3b_word dest_data_in,
	input lc3b_word trapvector_in,
	input logic [3:0] shfval_in,
	
	output lc3b_control_word ctrl_out,
	output lc3b_word sr1_out,
	output lc3b_word sr2_out,
	output lc3b_word offset6_out,
	output lc3b_word branch_offset_out,
	output lc3b_nzp nzp_out,
	output lc3b_reg dest_out,
	output lc3b_word pc_out,
	output lc3b_word dest_data_out,
	output lc3b_word trapvector_out,
	output logic [3:0] shfval_out,
	
	input logic stall_pipeline
);

lc3b_control_word ctrl;
lc3b_word sr1;
lc3b_word sr2;
lc3b_word offset6;
lc3b_word branch_offset;
lc3b_nzp nzp;
lc3b_reg dest;
lc3b_word pc;
lc3b_word dest_data;
lc3b_word trapvector;
logic [3:0] shfval;

always_ff @(posedge clk)
begin
	if(stall_pipeline == 0) begin
		ctrl <= ctrl_in;
		sr1 <= sr1_in;
		sr2 <= sr2_in;
		offset6 <= offset6_in;
		branch_offset <= branch_offset_in;
		nzp <= nzp_in;
		dest <= dest_in;
		pc <= pc_in;
		dest_data <= dest_data_in;
		trapvector <= trapvector_in;
		shfval <= shfval_in;
	end	
end

always_comb
begin
	ctrl_out = ctrl;
	sr1_out = sr1;
	sr2_out = sr2;
	offset6_out = offset6;
	branch_offset_out = branch_offset;
	nzp_out = nzp;
	dest_out = dest;
	pc_out = pc;
	dest_data_out = dest_data;
	trapvector_out = trapvector;
	shfval_out = shfval;
end
endmodule : ID_EX_pipeline