import lc3b_types::*;

module IF_ID_pipeline
(
	input clk,
	input lc3b_word instruction_in,
	output lc3b_word instruction_out,
	input logic stall_pipeline
);

lc3b_word instruction;

always_ff @(posedge clk)
begin
	if(stall_pipeline == 0)
		instruction <= instruction_in;
end

always_comb
begin
	instruction_out = instruction;
end
endmodule : IF_ID_pipeline