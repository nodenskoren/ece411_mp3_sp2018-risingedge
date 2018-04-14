import lc3b_types::*;

module evict_buffer
(
	wishbone.slave wb_l2,		//wb with l2 cache
	wishbone.master wb_mem,		//wb with pmem
	input mem_read, mem_write
);


logic evict_load;
logic evict_ack;
logic evict_rty;
logic pmem_write;

logic [127:0] pmem_wdata;
/* slave outputs to L2 cache */
assign wb_l2.DAT_S = wb_mem.DAT_S;
assign wb_l2.ACK = evict_ack;
assign wb_l2.RTY = evict_rty;

/* master outputs to pmem */
assign wb_mem.DAT_M = pmem_wdata;
assign wb_mem.CYC = pmem_write | mem_read;
assign wb_mem.STB = pmem_write | mem_read;
assign wb_mem.WE = pmem_write;
assign wb_mem.SEL = 16'hFFFF;	//always write full line
assign wb_mem.ADR = wb_l2.ADR;



register #(.width(128)) eviction
(
	.clk(wb_l2.CLK),
	.load(evict_load),
	.in(wb_l2.DAT_M),
	.out(pmem_wdata)
);

enum int unsigned {
	/* list of states */
	idle,
	load_line,
	write_back
} state, next_state;

always_comb
begin : state_actions
	/* Default state assignments */
	evict_load = 1'b0;
	evict_rty = wb_mem.RTY;
	evict_ack = wb_mem.ACK;
	pmem_write = 1'b0;
	
	/* Actions for each state */
	case(state)
		idle : /* empty, wait for write, so do nothing */;
		
		load_line : begin		//write request received, load register and send ack to l2
			evict_load = 1'b1;
			evict_ack = 1'b1;
		end
		
		write_back : begin	//write line to pmem
			evict_rty = 1'b1;
			pmem_write = 1'b1;
		end
			
		default: /* Do nothing */;
	endcase
end

always_comb
begin : next_state_logic
	case(state)
		default: next_state = idle;
		
		idle : begin
			if (mem_write) next_state = load_line;
			else next_state = idle;
		end
		
		load_line : begin
			next_state = write_back;
		end
		
		write_back : begin
			if(wb_mem.ACK) next_state = idle;
			else next_state = write_back;
		end
		
	endcase
end

always_ff @(posedge wb_l2.CLK)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end	

	

endmodule : evict_buffer