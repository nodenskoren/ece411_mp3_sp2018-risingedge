import lc3b_types::*;

module IF_ID_pipeline
(
	input clk,
	input lc3b_word instruction_in,
	output lc3b_word instruction_out,
	input logic stall_pipeline,
	input logic [7:0] branch_history_in,
	output logic [7:0] branch_history_out,
	input logic branch_prediction_in,
	output logic branch_prediction_out,
	input lc3b_word branch_address_in,
	output lc3b_word branch_address_out,
	input lc3b_word pc_in,
	output lc3b_word pc_out
);

lc3b_word instruction;
logic [7:0] branch_history;
logic branch_prediction;
lc3b_word branch_address;
lc3b_word pc;

always_ff @(posedge clk)
begin
	if(stall_pipeline == 0) begin
		instruction <= instruction_in;
		branch_history <= branch_history_in;
		branch_prediction <= branch_prediction_in;
		branch_address <= branch_address_in;
		pc <= pc_in;
	end
end

always_comb
begin
	instruction_out = instruction;
	branch_history_out = branch_history;
	branch_prediction_out = branch_prediction;
	branch_address_out = branch_address;
	pc_out = pc;
end
endmodule : IF_ID_pipeline