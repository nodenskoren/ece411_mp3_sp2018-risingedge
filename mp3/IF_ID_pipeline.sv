module IF_ID_pipeline
(
	input clk,
	input lc3b_word instruction_in,
	output lc3b_word instruction_out
);

lc3b_word instruction;

always_ff @(posedge clk)
begin
	instruction <= instruction_in;
end

always_comb
begin
	instruction_out = instruction;
end
endmodule : IF_ID_pipeline