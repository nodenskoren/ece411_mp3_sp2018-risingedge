import lc3b_types::*;

module dynamic_branch_prediction
(
	input logic clk,
	input logic [9:0] pc_out,
	input lc3b_opcode instruction,
	
	input logic is_branch_EX_MEM,
	input logic branched_EX_MEM,
	input logic [9:0] pc_out_EX_MEM,
	input logic [9:0] branch_history_EX_MEM,	
	input lc3b_word branch_address_EX_MEM,	
	
	output logic branch_prediction,
	output lc3b_word branch_address_out,	
	output logic [9:0] branch_history_out
);

logic [1:0] pht[1024];
lc3b_word branch_target_table[1024];
logic [9:0] curr;
logic [9:0] prev;
logic [9:0] branch_history;

initial begin
	for(int i = 0; i < 1024; i++) begin
		pht[i] = 2'b01;
	end
end

always_ff @(posedge clk)
begin
	curr <= pc_out ^ branch_history;
	prev <= pc_out_EX_MEM ^ branch_history_EX_MEM;	
end

always_comb begin
	if(instruction == op_br || instruction == op_jmp || instruction == op_jsr || instruction == op_trap) begin
		if(pht[curr] == 2'b00 || pht[curr] == 2'b01) begin
			branch_prediction = 1'b0;
		end
		else begin
			branch_prediction = 1'b1;
		end		
	end
	else begin
		branch_prediction = 1'b0;
	end
	branch_history_out = branch_history;
	branch_address_out = branch_target_table[curr];
end

always_ff @(posedge clk)
begin : pht_update
	if(is_branch_EX_MEM == 1'b1) begin
		if(branched_EX_MEM == 1'b1) begin
			if(pht[prev] != 2'b11) begin
				pht[prev] <= pht[prev] + 2'b01;
			end
			branch_target_table[prev] <= branch_address_EX_MEM;
		end
		else begin
			if(pht[prev] != 2'b00) begin
				pht[prev] <= pht[prev] - 2'b01;
			end
		end	
		branch_history <= {branch_history[8:0], branched_EX_MEM};
	end
end	
endmodule : dynamic_branch_prediction
