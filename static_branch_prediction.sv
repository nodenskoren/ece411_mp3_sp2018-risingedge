import lc3b_types::*;

module static_branch_prediction
(
	input logic clk,
	input logic branch_enable,
	input logic load_regfile,
	input logic mem_write_in,
	output logic load_regfile_out,
	output logic mem_write_out
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
	case(state)
		s_branch_detection: /* do nothing */;
		s_flush_1: begin
			mem_write_out = 1'b0;
			load_regfile_out = 1'b0;
		end
		s_flush_2: begin
			mem_write_out = 1'b0;
			load_regfile_out = 1'b0;
		end
		s_flush_3: begin
			mem_write_out = 1'b0;
			load_regfile_out = 1'b0;
		end		
		default: ;
	endcase
end

always_comb
begin: next_state_logic
	next_state = state;
	case(state)
		s_branch_detection: begin
			if(branch_enable == 0) begin
				next_state = s_flush_1;
			end
			else begin
				next_state = s_branch_detection;
			end
		end
		s_flush_1: begin
			next_state = s_flush_2;
		end
		s_flush_2: begin
			next_state = s_flush_3;
		end
		s_flush_3: begin
			next_state = s_branch_detection;
		end
	endcase	
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end
	
endmodule : static_branch_prediction