import lc3b_types::*;

module always_branch
(
	input logic clk,
	input [7:0] pc,
	input lc3b_opcode instruction,
	input lc3b_word full_instruction,
	input lc3b_opcode instruction_EX_MEM,
	input logic stall,
	output logic branch_prediction,
	output lc3b_word branch_prediction_address,
	output logic [7:0] branch_history_out,
	output logic prediction_made,
	output logic btb_access,
	
	input [7:0] pc_EX_MEM,
	input [7:0] branch_history_EX_MEM,
	input lc3b_word br_address,
	input lc3b_word jsr_address,
	input lc3b_word jmp_address,
	input lc3b_word trap_address,
	input logic branch_enable,
	input logic jmp_enable,
	input logic trap_enable,
	input logic jsr_enable,
	input logic branched,
	input logic flushed
);

lc3b_word btb[255:0];
logic [1:0] pht[255:0];
logic [7:0] branch_history;
logic [7:0] curr, prev;
logic btb_update;

initial begin
	for(int i = 0; i < 256; i++) begin
		btb[i] = 16'b0;
		pht[i] = 2'b01;
	end
end

always_ff @(posedge clk)
begin
	curr <= pc ^ branch_history;
	prev <= pc_EX_MEM ^ branch_history_EX_MEM;	
end

always_comb begin
	prediction_made = 1'b0;
	btb_access = 1'b0;
	if(instruction == op_br || instruction == op_jmp || instruction == op_jsr || instruction == op_trap) begin
		if(flushed == 1'b1 || stall == 1'b1 || full_instruction == 16'h0000 || instruction === 16'hXXXX) begin
			branch_prediction = 1'b0;
		end
		else begin
			if(pht[curr] == 2'b00 || pht[curr] == 2'b01)
				branch_prediction = 1'b0;
			else begin
				branch_prediction = 1'b1;
				btb_access = 1'b1;
			end
			prediction_made = 1'b1;
		end
	end
	else begin
		branch_prediction = 1'b0;
	end
	branch_prediction_address = btb[pc];
	branch_history_out = branch_history;
end

always_ff @(posedge clk) begin
	if(branched == 1'b1) begin
		if(branch_enable == 1) begin
			btb[pc_EX_MEM] <= br_address;
			btb_update <= 1'b1;
		end
		else if(jmp_enable == 1 && jsr_enable == 1) begin
			btb[pc_EX_MEM] <= jsr_address;
			btb_update <= 1'b1;
		end
		else if(jmp_enable == 1 && jsr_enable == 0) begin
			btb[pc_EX_MEM] <= jmp_address;
			btb_update <= 1'b1;
		end
		else if(trap_enable == 1) begin
			btb[pc_EX_MEM] <= trap_address;
			btb_update <= 1'b1;
		end
	end
	else
		btb_update <= 0;
end

always_ff @(posedge clk)
begin : pht_update
	if(stall == 1'b0 && (instruction_EX_MEM == op_br || instruction_EX_MEM == op_jmp || instruction_EX_MEM == op_jsr || instruction_EX_MEM == op_trap)) begin
		if(branched == 1'b1) begin
			if(pht[prev] != 2'b11) begin
				pht[prev] <= pht[prev] + 2'b01;
			end
		end
		else if(branched == 1'b0) begin
			if(pht[prev] != 2'b00) begin
				pht[prev] <= pht[prev] - 2'b01;
			end
		end
		branch_history <= {branch_history[6:0], branched};
	end
end

endmodule : always_branch
