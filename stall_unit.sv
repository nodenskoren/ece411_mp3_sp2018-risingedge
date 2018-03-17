import lc3b_types::*;

module stall_unit
(
	input logic clk,
	input logic mem_read_in,
	input logic mem_write_in,
	input logic mem_resp,
	input lc3b_wb_adr mem_address_in,
	input logic is_ldi,
	input logic is_sti,
	input logic [3:0] line_offset_in,
	output logic stall_pipeline,
	output logic mem_read,
	output logic mem_write,
	output lc3b_wb_adr mem_address,
	input lc3b_word mem_rdata,
	output logic [3:0] line_offset_out
	//output logic sti_write
);

lc3b_word mem_address_buffer;

enum int unsigned {
    /* List of states */
	s_read_write,
	//s_wait_1,
	s_ldi,
	s_sti
	//s_wait_2
	//s_read_write_twice,
	//s_ack_wait,
	//s_ack_wait_int
} state, next_state;

always_comb
begin: state_actions
	stall_pipeline = 1'b0;
	mem_read = mem_read_in;
	mem_write = mem_write_in;
	mem_address = mem_address_in;
	line_offset_out = line_offset_in;
	case(state)
		s_read_write: begin
			if(is_ldi == 1 || is_sti == 1) begin						
				stall_pipeline = 1'b1;
			end
			else begin
				stall_pipeline = 1'b0;
			end
		end
		s_ldi: begin
			mem_read = 1'b1;
			mem_write = 1'b0;
			mem_address = mem_address_buffer[15:4];
			line_offset_out = mem_address_buffer[3:0];
			stall_pipeline = 1'b0;
		end
		s_sti: begin
			mem_read = 1'b0;
			mem_write = 1'b1;
			mem_address = mem_address_buffer[15:4];
			line_offset_out = mem_address_buffer[3:0];
			stall_pipeline = 1'b0;			
		end
		default: ;
	endcase
end

always_comb
begin: next_state_logic
	next_state = state;
	case(state)
	/*
		s_read_write: begin
			if(is_ldi == 0 && is_sti == 0) begin
				if(mem_read == 1 || mem_write == 1) begin
					if(mem_resp == 0)
						next_state = s_read_write;
					else
						next_state = s_ack_wait;
				end
			end
			else begin
				if(mem_resp == 0)
					next_state = s_read_write;
				else
					next_state = s_ack_wait_int;
			end
		end
		
		s_ack_wait_int: begin
			if(mem_resp == 0)
				next_state = s_read_write_twice;
			else
				next_state = s_ack_wait_int;
		end
		
		s_read_write_twice: begin
			if(mem_resp == 0)
				next_state = s_read_write_twice;
			else
				next_state = s_ack_wait;
		end

		s_ack_wait: begin
			if(mem_resp == 0)
				next_state = s_read_write;
			else
				next_state = s_ack_wait;
		end
	*/
		s_read_write: begin
			if(is_ldi == 1 || is_sti == 1) begin
				if(is_ldi == 1)
					next_state = s_ldi;
				else if(is_sti == 1)
					next_state = s_sti;
			end
			else
				next_state = s_read_write;
		end
		/*
		s_wait_1: begin
			if(is_sti == 1)
				next_state = s_sti;
			else
				next_state = s_ldi;
		end*/
		
		s_ldi: begin
			if(mem_resp == 0)
				next_state = s_ldi;
			else
				next_state = s_read_write;
		end
		
		s_sti: begin
			if(mem_resp == 0)
				next_state = s_sti;
			else
				next_state = s_read_write;
		end
		/*
		s_wait_2: begin
			next_state = s_read_write;
		end*/
	
	endcase	
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
	 mem_address_buffer <= mem_rdata;
end
	
endmodule : stall_unit