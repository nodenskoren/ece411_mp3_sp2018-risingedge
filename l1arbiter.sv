import lc3b_types::*;

module l1arbiter
(
	input clk,
	input i_rw, d_rw,
	input mem_resp,
	output logic cache_sel
);

enum int unsigned {
	/* List of states */
	idle,
	service_d,
	service_i
} state, next_state;

always_comb
begin : state_actions
	/* Default output assignments */
	cache_sel = 0;
	
	/* Actions for each state */
	case(state)
		idle: /* Do nothing */;
		
		service_d: cache_sel = 0;
		
		service_i: cache_sel = 1;
		
		default: /* Do nothing */;
	endcase
end

always_comb
begin : next_state_logic
	case(state)
		default: next_state = idle;
		idle:begin
			if(d_rw) next_state = service_d;
			else if (i_rw) next_state = service_i;
			else next_state = idle;
		end
		
		service_d:begin
			if(!mem_resp) next_state = service_d;
			else if(i_rw) next_state = service_i;
			else next_state = idle;
		end
		
		service_i:begin
			if(!mem_resp) next_state = service_i;
			else if (d_rw) next_state = service_d;
			else next_state = idle;
		end
	endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
	state <= next_state;
end
			
endmodule : l1arbiter