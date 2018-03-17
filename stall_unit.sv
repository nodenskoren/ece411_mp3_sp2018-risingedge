module stall_unit
(
	input logic clk,
	input logic mem_read,
	input logic mem_write,
	input logic mem_resp,
	input logic ifetch_resp,
	input logic is_ldi,
	input logic is_sti,
	output logic stall_pipeline,
	output logic sti_write,
	output logic is_second_access
);

enum int unsigned {
    /* List of states */
	s_read_write,
	s_read_write_twice
} state, next_state;

always_comb
begin: state_actions
	stall_pipeline = 1'b0;
	sti_write = 1'b0;
	is_second_access = 1'b0;
	case(state)
		s_read_write: begin
			if(is_ldi == 1 || is_sti == 1)
				stall_pipeline = 1'b1;
			else if (((mem_read == 1 || mem_write == 1) && mem_resp == 0) || ifetch_resp == 0)
				stall_pipeline = 1'b1;
		end
	
		s_read_write_twice: begin
			is_second_access = 1'b1;
			if(mem_resp == 0)
				stall_pipeline = 1'b1;
			if(is_sti == 1'b1)
				sti_write = 1'b1;
		end
	endcase
end

always_comb
begin: next_state_logic
	next_state = state;
	case(state)
		s_read_write: begin
			if(is_ldi == 0 && is_sti == 0) begin
				if(mem_read == 1 || mem_write == 1) begin
						next_state = s_read_write;
				end
			end
			else begin
				if(mem_resp == 0)
					next_state = s_read_write;
				else
					next_state = s_read_write_twice;
			end
		end

		
		s_read_write_twice: begin
			if(mem_resp == 0)
				next_state = s_read_write_twice;
			else
				next_state = s_read_write;
		end
		
	endcase	
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end
	
endmodule : stall_unit