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
logic pmem_read;
logic service_evict;
logic adr_load;
logic [11:0] evict_adr, pmem_adr;
//assign pmem_read = mem_read & !(service_evict);
always_comb begin
	if(service_evict) begin
		pmem_read = 1'b0;
		pmem_adr = evict_adr;
	end
	else begin
		pmem_read = mem_read;
		pmem_adr = wb_l2.ADR;
	end
end
		

logic [127:0] pmem_wdata;
/* slave outputs to L2 cache */
assign wb_l2.DAT_S = wb_mem.DAT_S;
assign wb_l2.ACK = evict_ack;
assign wb_l2.RTY = evict_rty;

/* master outputs to pmem */
assign wb_mem.DAT_M = pmem_wdata;
assign wb_mem.CYC = pmem_write | pmem_read;
assign wb_mem.STB = pmem_write | pmem_read;
assign wb_mem.WE = pmem_write;
assign wb_mem.SEL = 16'hFFFF;	//always write full line
assign wb_mem.ADR = pmem_adr;




register #(.width(128)) eviction
(
	.clk(wb_l2.CLK),
	.load(evict_load),
	.in(wb_l2.DAT_M),
	.out(pmem_wdata)
);

register #(.width(12)) evict_address
(
	.clk(wb_l2.CLK),
	.load(adr_load),
	.in(wb_l2.ADR),
	.out(evict_adr)
);

enum int unsigned {
	/* list of states */
	idle,
	load_line,
	write_back,
	stall,
	wait_for_load,
	stall2
} state, next_state;

always_comb
begin : state_actions
	/* Default state assignments */
	evict_load = 1'b0;
	evict_rty = wb_mem.RTY;
	evict_ack = wb_mem.ACK;
	pmem_write = 1'b0;
	service_evict = 1'b0;
	adr_load = 1'b0;
	
	/* Actions for each state */
	case(state)
		idle :  /* empty, wait for write, so pass l2 values */ ;
		
		load_line : begin		//write request received, load register and send ack to l2
			evict_load = 1'b1;
			adr_load = 1'b1;
			evict_ack = 1'b1;
			//service_evict = 1'b1;
		end
		
		wait_for_load : /* wait for L2 to load next line */ ;
		
		stall2 : /* sets cyc low */ ;
			
		
		write_back : begin	//write line to pmem
			evict_rty = 1'b1;
			pmem_write = 1'b1;
			evict_ack = 1'b0;
			service_evict = 1'b1;
		end
		
		stall : begin			//one cycle so pmem ack can go low
			evict_ack = 1'b0;
			service_evict = 1'b1;
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
			next_state = wait_for_load;
		end
		
		wait_for_load : begin
			if(wb_mem.ACK) next_state = stall2;
			else next_state = wait_for_load;
		end
		
		stall2 : begin
			next_state = write_back;
		end
		
		write_back : begin
			if(wb_mem.ACK) next_state = stall;
			else next_state = write_back;
		end
		
		stall : begin
			next_state = idle;
		end
		
	endcase
end

always_ff @(posedge wb_l2.CLK)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
	 //evict_adr <= next_evict_adr;
end	

	

endmodule : evict_buffer
