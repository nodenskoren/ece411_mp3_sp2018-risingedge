import lc3b_types::*;

module stall_unit_2
(
	input logic clk,
	input lc3b_opcode operation,
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
			if(operation == op_ldb || operation == op_ldi || operation == op_ldr) begin						
				stall_pipeline_load = 1'b1;
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
			if(operation == op_ldb || operation == op_ldi || operation == op_ldr) begin
				next_state = s_load_wait;
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