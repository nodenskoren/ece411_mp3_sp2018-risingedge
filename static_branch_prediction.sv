import lc3b_types::*;

module static_branch_prediction
(
	input logic load_cc_in,
	output logic load_cc_out,
	input logic clk,
	input logic branch_enable,
	input logic load_regfile,
	input logic unconditional_branch,
	input logic stall,
	input logic mem_write_in,
	output logic load_regfile_out,
	output logic mem_write_out,
	output logic branch_enable_out,
	input logic mem_read_in,
	input lc3b_opcode is_load,
	input logic is_j_in,
	output logic is_j_out,
	input logic is_jsr_in,
	output logic is_jsr_out,
	input logic is_trap_in,
	output logic is_trap_out,
	output logic flushed,
	output logic mem_read_out,
	output logic [1:0] forwarding_mask,
	//output logic sti_write
	
	input lc3b_word br_address,
	input lc3b_word jsr_address,
	input lc3b_word jmp_address,
	input lc3b_word trap_address,
	input lc3b_word branch_prediction_address,
	input logic branch_prediction,
	input lc3b_word instruction,
	
	output logic prediction_fail,
	output logic btb_fail
);

enum int unsigned {
    /* List of states */
	s_branch_detection,
	s_flush_1,
	s_flush_2,
	s_flush_3,
	s_post_flush
} state, next_state;

always_comb
begin: state_actions
	load_regfile_out = load_regfile;
	mem_write_out = mem_write_in;
	mem_read_out = mem_read_in;
	branch_enable_out = branch_enable;
	is_j_out = is_j_in;
	is_jsr_out = is_jsr_in;
	is_trap_out = is_trap_in;
	flushed = 1'b0;
	forwarding_mask = 2'b11;
	load_cc_out = load_cc_in;
	case(state)
		s_branch_detection: begin
		/*
			if(instruction == 16'h0000) begin
					load_regfile_out = 1'b0;
					mem_write_out = 1'b0;
					mem_read_out = 1'b0;
					branch_enable_out = 1'b0;
					is_j_out = 1'b0;
					is_jsr_out = 1'b0;
					is_trap_out = 1'b0;
			end*/
		end
		s_flush_1: begin
			mem_write_out = 1'b0;
			load_regfile_out = 1'b0;
			branch_enable_out = 1'b0;
			is_j_out = 1'b0;
			is_jsr_out = 1'b0;
			is_trap_out = 1'b0;
			flushed = 1'b1;
			mem_read_out = 1'b0;
			load_cc_out = 1'b0;
		end
		s_flush_2: begin
			mem_write_out = 1'b0;
			load_regfile_out = 1'b0;
			branch_enable_out = 1'b0;
			is_j_out = 1'b0;
			is_jsr_out = 1'b0;
			is_trap_out = 1'b0;
			flushed = 1'b1;
			mem_read_out = 1'b0;
			load_cc_out = 1'b0;
		end
		s_flush_3: begin
			mem_write_out = 1'b0;
			load_regfile_out = 1'b0;
			branch_enable_out = 1'b0;
			is_j_out = 1'b0;
			is_jsr_out = 1'b0;
			is_trap_out = 1'b0;
			flushed = 1'b1;
			mem_read_out = 1'b0;
			forwarding_mask = 2'b00;
			load_cc_out = 1'b0;
		end

		s_post_flush: begin
			forwarding_mask = 2'b10;
		end
		default: ;
	endcase
end

always_comb
begin: next_state_logic
	next_state = state;
	prediction_fail = 0;
	btb_fail = 1'b1;
	case(state)
		s_branch_detection: begin
			if(instruction == 16'h0000 || instruction === 16'hXXXX) begin
				next_state = s_branch_detection;
			end
			else if(((branch_enable == 1 || is_j_in == 1 || is_jsr_in == 1 || is_trap_in == 1) && branch_prediction == 1'b1) && stall == 0) begin
				// br case
				if(branch_enable == 1 && (br_address != branch_prediction_address)) begin
					next_state = s_flush_1;
					//prediction_fail = 1'b1;
					btb_fail = 1'b1;
				end
				else if(branch_enable == 1 && (br_address == branch_prediction_address)) begin
					next_state = s_branch_detection;
					//prediction_fail = 1'b1;
					btb_fail = 1'b0;
				end
				// jsrr/jmp case
				else if(is_j_in == 1 && is_jsr_in == 0 && (jmp_address != branch_prediction_address)) begin
					next_state = s_flush_1;
					//prediction_fail = 1'b1;
					btb_fail = 1'b1;					
				end
				
				else if(is_j_in == 1 && is_jsr_in == 0 && (jmp_address == branch_prediction_address)) begin
					next_state = s_branch_detection;
					//prediction_fail = 1'b1;
					btb_fail = 1'b0;					
				end				
				// jsr case
				else if(is_j_in == 1 && is_jsr_in == 1 && (jsr_address != branch_prediction_address)) begin
					next_state = s_flush_1;
					//prediction_fail = 1'b1;
					btb_fail = 1'b1;					
				end
				else if(is_j_in == 1 && is_jsr_in == 1 && (jsr_address == branch_prediction_address)) begin
					next_state = s_branch_detection;
					//prediction_fail = 1'b1;
					btb_fail = 1'b0;					
				end				
				
				// trap case
				else if(is_trap_in == 1 && (trap_address != branch_prediction_address)) begin
					next_state = s_flush_1;
					//prediction_fail = 1'b1;
					btb_fail = 1'b1;					
				end
				else if(is_trap_in == 1 && (trap_address == branch_prediction_address)) begin
					next_state = s_branch_detection;
					//prediction_fail = 1'b1;
					btb_fail = 1'b0;					
				end				
				
				else begin
					next_state = s_branch_detection;
				end
			end
			else if(((branch_enable == 1 || is_j_in == 1 || is_jsr_in == 1 || is_trap_in == 1) && branch_prediction == 1'b0) && stall == 0) begin
				next_state = s_flush_1;
				prediction_fail = 1'b1;
			end			
			else if(((branch_enable == 0 && is_j_in == 0 && is_jsr_in == 0 && is_trap_in == 0) && branch_prediction == 1'b1) && stall == 0) begin
				next_state = s_flush_1;
				prediction_fail = 1'b1;
			end
			else begin
				next_state = s_branch_detection;
			end
		end
		s_flush_1: begin
			if(stall == 0) begin
				next_state = s_flush_2;
			end
		end
	
		s_flush_2: begin		
			if(stall == 0) begin	
				next_state = s_flush_3;
			end		
		end
		
		s_flush_3: begin
			if(stall == 0) begin
				next_state = s_post_flush;
			end
		end	
		s_post_flush: begin
			if(((branch_enable == 1 || is_j_in == 1 || is_jsr_in == 1 || is_trap_in == 1) && branch_prediction == 1'b1) && stall == 0) begin
				// br case
				if(branch_enable == 1 && (br_address != branch_prediction_address)) begin
					next_state = s_flush_1;
					btb_fail = 1'b1;					
				end
				else if(branch_enable == 1 && (br_address == branch_prediction_address)) begin
					next_state = s_branch_detection;
					//prediction_fail = 1'b1;
					btb_fail = 1'b0;
				end				
				// jsrr/jmp case
				else if(is_j_in == 1 && is_jsr_in == 0 && (jmp_address != branch_prediction_address)) begin
					next_state = s_flush_1;
					//prediction_fail = 1'b1;					
					btb_fail = 1'b1;					
				end
				else if(is_j_in == 1 && is_jsr_in == 0 && (jmp_address == branch_prediction_address)) begin
					next_state = s_branch_detection;
					//vprediction_fail = 1'b1;
					btb_fail = 1'b0;					
				end								
				// jsr case
				else if(is_j_in == 1 && is_jsr_in == 1 && (jsr_address != branch_prediction_address)) begin
					next_state = s_flush_1;
					//prediction_fail = 1'b1;					
					btb_fail = 1'b1;					
				end
				else if(is_j_in == 1 && is_jsr_in == 1 && (jsr_address == branch_prediction_address)) begin
					next_state = s_branch_detection;
					//prediction_fail = 1'b1;					
					btb_fail = 1'b0;					
				end				
				// trap case					
				else if(is_trap_in == 1 && (trap_address != branch_prediction_address)) begin
					next_state = s_flush_1;
					//prediction_fail = 1'b1;					
					btb_fail = 1'b1;					
				end
				else if(is_trap_in == 1 && (trap_address == branch_prediction_address)) begin
					next_state = s_branch_detection;
					//prediction_fail = 1'b1;
					btb_fail = 1'b0;					
				end					
				else begin
					next_state = s_branch_detection;
				end
			end
			else if(((branch_enable == 1 || is_j_in == 1 || is_jsr_in == 1 || is_trap_in == 1) && branch_prediction == 1'b0) && stall == 0) begin
				next_state = s_flush_1;
				prediction_fail = 1'b1;				
			end				
			else if(((branch_enable == 0 && is_j_in == 0 && is_jsr_in == 0 && is_trap_in == 0) && branch_prediction == 1'b1) && stall == 0) begin
				next_state = s_flush_1;
				prediction_fail = 1'b1;				
			end			
			else if(stall == 0) begin
				next_state = s_branch_detection;
			end
			else begin
				next_state = s_post_flush;
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
