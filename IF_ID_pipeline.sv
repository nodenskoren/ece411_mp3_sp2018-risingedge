import lc3b_types::*;

module IF_ID_pipeline
(
	input clk,
	input ifetch_resp,
	input lc3b_word instruction_in,
	output load_pc,
	output lc3b_word instruction_out
);

lc3b_word instruction;
logic pc_load;
assign load_pc = pc_load;
always_ff @(posedge clk)
begin
	if(ifetch_resp) begin
		instruction <= instruction_in;
		pc_load <= 1;
	end
	else pc_load <= 0;
end

always_comb
begin
	instruction_out = instruction;
	//load_pc = pc_load;
end
endmodule : IF_ID_pipeline