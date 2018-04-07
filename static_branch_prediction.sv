import lc3b_types::*;

module static_branch_prediction
(
	input logic clk,
	input logic branch_enable,
	input logic load_regfile,
	input logic unconditional_branch,
	input logic stall,
	input logic mem_write_in,
	output logic load_regfile_out,
	output logic mem_write_out,
	output logic branch_enable_out
	//output logic sti_write
);

enum int unsigned {
    /* List of states */
	s_branch_detection,
	s_flush_1,
	s_flush_2,
	s_flush_3
} state, next_state;

always_comb
begin: state_actions
	load_regfile_out = load_regfile;
	mem_write_out = mem_write_in;
	branch_enable_out = branch_enable;
	case(state)
		s_branch_detection: /* do nothing */;
		s_flush_1: begin
			mem_write_out = 1'b0;
			load_regfile_out = 1'b0;
			branch_enable_out = 1'b0;
		end
		s_flush_2: begin
			mem_write_out = 1'b0;
			load_regfile_out = 1'b0;
			branch_enable_out = 1'b0;
		end
		s_flush_3: begin
			mem_write_out = 1'b0;
			load_regfile_out = 1'b0;
			branch_enable_out = 1'b0;
		end		
		default: ;
	endcase
end

always_comb
begin: next_state_logic
	next_state = state;
	case(state)
		s_branch_detection: begin
			if((branch_enable == 1 || unconditional_branch == 1) && stall == 0) begin
				next_state = s_flush_1;
			end
			else begin
				next_state = s_branch_detection;
			end
		end
		s_flush_1: begin
			if(stall == 0) begin
				next_state = s_flush_2;
			end
			else begin
				next_state = s_flush_1;
			end
		end
		s_flush_2: begin
			if(stall == 0) begin		
				next_state = s_flush_3;
			end
			else begin
				next_state = s_flush_2;
			end			
		end
		s_flush_3: begin
			if(stall == 0) begin			
				next_state = s_branch_detection;
			end
			else begin
				next_state = s_flush_3;
			end
		end
	endcase	
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end
	
endmodule : static_branch_prediction