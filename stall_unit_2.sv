import lc3b_types::*;

module stall_unit_2
(
	input logic clk,
	input lc3b_word instruction_curr,
	input lc3b_word instruction_last,
	input logic flushed,
	output logic stall_pipeline_load
	//output logic sti_write
);

enum int unsigned {
    /* List of states */
	s_check,
	s_load_wait
} state, next_state;

always_comb
begin: state_actions
	stall_pipeline_load = 1'b0;
	case(state)
		s_check: begin
			if((instruction_last[15:12] == 4'b0110 || instruction_last[15:12] == 4'b1010 || instruction_last[15:12] == 4'b0010) && flushed == 1'b0) begin
				if(((instruction_last[11:9] == instruction_curr[8:6]) && !(instruction_curr[15:12] == 4'b0000 && instruction_curr[15:12] == 4'b1110 && instruction_curr[15:12] == 4'b1111 && instruction_curr[15:11] == 5'b01001)) || ((instruction_last[11:9] == instruction_curr[8:6]) && (instruction_curr[5] == 0) && (instruction_curr[15:12] == 4'b0001 || instruction_curr[15:12] == 4'b0101))) begin
					stall_pipeline_load = 1'b1;
				end
			end
		end
		s_load_wait: begin
			stall_pipeline_load = 1'b0;
		end
		default: ;
	endcase
end

always_comb
begin: next_state_logic
	next_state = state;
	case(state)
		s_check: begin
			if((instruction_last[15:12] == 4'b0110 || instruction_last[15:12] == 4'b1010 || instruction_last[15:12] == 4'b0010) && flushed == 1'b0) begin
				if(((instruction_last[11:9] == instruction_curr[8:6]) && !(instruction_curr[15:12] == 4'b0000 && instruction_curr[15:12] == 4'b1110 && instruction_curr[15:12] == 4'b1111 && instruction_curr[15:11] == 5'b01001)) || ((instruction_last[11:9] == instruction_curr[8:6]) && (instruction_curr[5] == 0) && (instruction_curr[15:12] == 4'b0001 || instruction_curr[15:12] == 4'b0101))) begin			
					next_state = s_load_wait;
				end
				else begin
					next_state = s_check;
				end
			end
			else begin
				next_state = s_check;
			end
		end
		s_load_wait: begin
			next_state = s_check;
		end
	endcase	
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end
	
endmodule : stall_unit_2