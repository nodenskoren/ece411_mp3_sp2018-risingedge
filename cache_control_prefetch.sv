import lc3b_types::*;

module cache_control_prefetch
(
	input clk,
	input readwrite, /*0 for read, 1 for write*/
	input dirty0_out,
	input dirty1_out,
	input valid0_out,
	input valid1_out,
	input hit0,
	input hit1,
	input LRU_out,
	input pmem_resp,
	input req,
	
	output logic data0_writeword,
	output logic data1_writeword,
	output logic data0_writeline,
	output logic data1_writeline,
	output logic tag0_write,
	output logic tag1_write,
	output logic valid0_write,
	output logic valid1_write,
	output logic valid_in,
	output logic dirty0_write,
	output logic dirty1_write,
	output logic dirty_in,
	output logic updateLRU,
	output logic pmem_write,
	output logic pmem_read,
	output logic cpu_resp,
	output logic wb_sel,
	output logic [1:0] adrmux_sel,
	output logic cache_hit_inc,
	output logic cache_miss_inc,
	output logic load_adr,
	output logic load_prefetch,
	output logic adr_in_sel

);

logic was_miss, was_miss_next;
logic prefetch_dirty, prefetch_dirty_next;

initial prefetch_dirty = 0;
initial was_miss= 1'b0;
always_ff @ (posedge clk)
begin
	was_miss <= was_miss_next;
	prefetch_dirty <= prefetch_dirty_next;
end

enum int unsigned {
    /* List of states */
	 idle,
	 write_back,
	 stall,
	 load_line,
	 update_cache,
	 
	 idle_prefetch,
	 wb_prefetch,
	 stall_prefetch,
	 load_line_prefetch,
	 update_cache_prefetch
} state, next_state;

always_comb
begin : state_actions
    /* Default output assignments */
	data0_writeword = 1'b0;
	data1_writeword = 1'b0;
	data0_writeline = 1'b0;
	data1_writeline = 1'b0;
	tag0_write = 1'b0;
	tag1_write = 1'b0;
	valid0_write = 1'b0;
	valid1_write = 1'b0;
	valid_in = 1'b0;
	dirty0_write = 1'b0;
	dirty1_write = 1'b0;
	dirty_in = 1'b0;
	updateLRU = 1'b0;
	pmem_write = 1'b0;
	pmem_read = 1'b0;
	cpu_resp = 1'b0;
	wb_sel = 0;
	cache_hit_inc = 1'b0;
	cache_miss_inc = 1'b0;
	was_miss_next = 0;
	adr_in_sel = 0;
	
	/* Actions for each state */
	 case(state)
		idle:begin
			if(readwrite == 0 && (hit0 || hit1)) begin
			
				/* count hit */
				if (!was_miss) begin
					cache_hit_inc = 1;
					was_miss_next = 0;
				end
				else was_miss_next = 0;
			
				cpu_resp = 1;
				if((hit0 && !LRU_out) || (hit1 && LRU_out)) begin
					updateLRU = 1;
				end
			end
			
			if(readwrite == 1 && (hit0 || hit1)) begin
			
				/* count hit */
				if (!was_miss_next) begin
					cache_hit_inc = 1;
					was_miss_next = 0;
				end
				else was_miss_next = 0;
				
				wb_sel = 1;
				dirty_in = 1;
				cpu_resp = 1;
				if (hit0) begin
					data0_writeline = 1;
					dirty0_write = 1;
				end
				else begin
					data1_writeline = 1;
					dirty1_write = 1;
				end
				if((hit0 && !LRU_out) || (hit1 && LRU_out)) begin
					updateLRU = 1;
				end
				
			end
			
			
		end
		
		write_back:begin
			pmem_write = 1;
			
		end
		
		stall: /* Do nothing. Sets CYC, STB to 0 for ACK */;
		
		load_line:begin
			pmem_read = 1;
			
			if(pmem_resp) begin
				valid_in = 1;
				dirty_in = 0;
				if(!valid0_out) begin
					data0_writeline = 1;
					tag0_write = 1;
					valid0_write = 1;
					dirty0_write = 1;
					if(!LRU_out) updateLRU = 1;
				end
				else if(!valid1_out || LRU_out) begin
					data1_writeline = 1;
					tag1_write = 1;
					valid1_write = 1;
					dirty1_write = 1;
					if(LRU_out) updateLRU = 1;
				end
				
				else begin
					data0_writeline = 1;
					tag0_write = 1;
					valid0_write = 1;
					dirty0_write = 1;
					if(!LRU_out) updateLRU = 1;
				end
			end
		end
		
		update_cache:begin
			/* count miss */
			cache_miss_inc = 1;
			was_miss_next= 1;
			adr_in_sel = 1;
		end
		
		idle_prefetch:begin
			if(readwrite == 0 && (hit0 || hit1)) begin
			
				/* count hit */
				if (!was_miss) begin
					cache_hit_inc = 1;
					was_miss_next = 0;
				end
				else was_miss_next = 0;
			
				cpu_resp = 1;
				if((hit0 && !LRU_out) || (hit1 && LRU_out)) begin
					updateLRU = 1;
				end
			end
			
			if(readwrite == 1 && (hit0 || hit1)) begin
			
				/* count hit */
				if (!was_miss_next) begin
					cache_hit_inc = 1;
					was_miss_next = 0;
				end
				else was_miss_next = 0;
				
				wb_sel = 1;
				dirty_in = 1;
				cpu_resp = 1;
				if (hit0) begin
					data0_writeline = 1;
					dirty0_write = 1;
				end
				else begin
					data1_writeline = 1;
					dirty1_write = 1;
				end
				if((hit0 && !LRU_out) || (hit1 && LRU_out)) begin
					updateLRU = 1;
				end
				
			end
		end
		
		wb_prefetch:begin
			pmem_write = 1;
			adr_in_sel = 1;
			
		end
		
		stall_prefetch: begin
			adr_in_sel = 1;
		end
		
		load_line_prefetch:begin
			adr_in_sel = 1;
			pmem_read = 1;
			
			if(pmem_resp) begin
				valid_in = 1;
				dirty_in = 0;
				if(!valid0_out) begin
					data0_writeline = 1;
					tag0_write = 1;
					valid0_write = 1;
					dirty0_write = 1;
					if(!LRU_out) updateLRU = 1;
				end
				else if(!valid1_out || LRU_out) begin
					data1_writeline = 1;
					tag1_write = 1;
					valid1_write = 1;
					dirty1_write = 1;
					if(LRU_out) updateLRU = 1;
				end
				
				else begin
					data0_writeline = 1;
					tag0_write = 1;
					valid0_write = 1;
					dirty0_write = 1;
					if(!LRU_out) updateLRU = 1;
				end
			end
		end
		
		update_cache_prefetch:begin
			/* count miss */
			cache_miss_inc = 1;
			was_miss_next= 1;
		end
		
		default: /* Do nothing */;
	endcase
end


always_comb
begin : next_state_logic
	load_adr = 0;
	adrmux_sel = 2'b00;
	prefetch_dirty_next = prefetch_dirty;
	load_prefetch = 0;
	case(state)
		default: next_state = idle;
		
		idle:begin
			if(req) begin
				if(!hit0 && !hit1) begin //miss
					load_adr = 1;
					if((LRU_out && dirty1_out) || (!LRU_out && dirty0_out)) begin //miss & dirty
						if(LRU_out) adrmux_sel = 2'b10;
						else adrmux_sel = 2'b01;
						next_state = write_back;
					end
				
					else begin
						next_state = load_line;	//miss & not dirty
					end
				end
				else begin
					next_state = idle;
				end
			end
			
			else begin
				next_state = idle;
			end
		end
		
		write_back:begin
			if(pmem_resp) next_state = stall;
			else next_state = write_back;
		end
		
		stall:begin
			load_adr = 1;
			next_state = load_line;
		end
		
		load_line:begin
			load_prefetch = 1;
			if(pmem_resp) next_state = update_cache;
			else next_state = load_line;
		end
		
		update_cache:begin
			if(!hit0 && !hit1) begin //miss
					load_adr = 1;
					next_state = idle_prefetch;
					if((LRU_out && dirty1_out) || (!LRU_out && dirty0_out)) begin //miss & dirty
						prefetch_dirty_next = 1;
						if(LRU_out) adrmux_sel = 2'b10;
						else adrmux_sel = 2'b01;
					
					end
				
					else begin
						prefetch_dirty_next = 0;
							//miss & not dirty
					end
				end
			else begin
				next_state = idle;
			end
		end
		idle_prefetch:begin
			if (prefetch_dirty)begin
				next_state = wb_prefetch;
			end
			else next_state = load_line_prefetch;
		end
		load_line_prefetch:begin
			if(pmem_resp) next_state = update_cache_prefetch;
			else next_state = load_line_prefetch;
		end
		wb_prefetch:begin
			if(pmem_resp) next_state = stall_prefetch;
			else next_state = wb_prefetch;
		end
		
		stall_prefetch:begin
			load_adr = 1;
			next_state = load_line_prefetch;
		end
		update_cache_prefetch: begin
			next_state = idle;
		end	
	endcase
end
	
always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end	

			



endmodule : cache_control_prefetch