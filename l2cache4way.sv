import lc3b_types::*;

module l2cache4way
(
	//input clk,
	wishbone.slave wb2,
	wishbone.master wb,
	//wishbone.slave wb2
	
	input logic l2_hit_clear, l2_miss_clear,
	output logic [15:0] cache_hit_cnt, cache_miss_cnt,
	
	output logic pmem_read, pmem_write

);

logic cpu_resp;
logic [127:0] cpu_data, pmem_wdata;
//logic pmem_write, pmem_read;
logic [15:0] pmem_sel;

logic [11:0] pmem_adr;

/* slave outputs to CPU */
assign wb2.DAT_S = cpu_data;
assign wb2.ACK = cpu_resp;
assign wb2.RTY = wb2.STB & wb2.CYC & (!cpu_resp);

/* master outputs to pmem */
assign wb.DAT_M = pmem_wdata;
assign wb.CYC = pmem_write | pmem_read;
assign wb.STB = pmem_write | pmem_read;
assign wb.WE = pmem_write;
assign wb.SEL = 16'hFFFF;	//always write full line
//assign wb.ADR = pmem_adr;
//assign wb.ADR = {wb2.ADR[15:3], 3'b000};


logic dirty0_out, dirty1_out, valid1_out, valid0_out;
logic dirty2_out, dirty3_out, valid2_out, valid3_out;
logic hit0, hit1, hit2, hit3;
logic [1:0] LRU_out;
logic data0_writeword, data1_writeword, data0_writeline, data1_writeline;
logic data2_writeword, data3_writeword, data2_writeline, data3_writeline;
logic tag0_write, tag1_write, tag2_write, tag3_write;
logic valid0_write, valid1_write, valid2_write, valid3_write, valid_in;
logic dirty0_write, dirty1_write, dirty2_write, dirty3_write, dirty_in;
logic updateLRU;
logic wb_sel;
logic [2:0] adrmux_sel;
logic cache_hit_inc, cache_miss_inc;
logic load_adr;



cache_datapath4way cache_datapath4way
(
	.clk(wb.CLK),
	.mem_address(wb2.ADR),
	.data0_writeline,
	.data1_writeline,
	.data2_writeline,
	.data3_writeline,
	.pmem_rdata(wb.DAT_S),
	.tag0_write,
	.tag1_write,
	.tag2_write,
	.tag3_write,
	.valid0_write,
	.valid1_write,
	.valid2_write,
	.valid3_write,
	.valid0_out,
	.valid1_out,
	.valid2_out,
	.valid3_out,
	.valid_in,
	.dirty0_write,
	.dirty1_write,
	.dirty2_write,
	.dirty3_write,
	.dirty_in,
	.dirty0_out,
	.dirty1_out,
	.dirty2_out,
	.dirty3_out,
	.updateLRU,
	.LRU_out,
	.hit0,
	.hit1,
	.hit2,
	.hit3,
	.pmem_wdata,
	.cpu_wdata(wb2.DAT_M),
	.cpu_rdata(cpu_data),
	.wb_sel,
	.offset_sel(wb2.SEL),
	.adrmux_sel,
	.pmem_adr
);


cache_control4way cache_controller4way
(
	.clk(wb.CLK),
	.readwrite(wb2.WE),
	.dirty0_out,
	.dirty1_out,
	.dirty2_out,
	.dirty3_out,
	.hit0,
	.hit1,
	.hit2,
	.hit3,
	.LRU_out,
	.pmem_resp(wb.ACK),
	.data0_writeword,
	.data1_writeword,
	.data2_writeword,
	.data3_writeword,
	.data0_writeline,
	.data1_writeline,
	.data2_writeline,
	.data3_writeline,
	.tag0_write,
	.tag1_write,
	.tag2_write,
	.tag3_write,
	.valid0_write,
	.valid1_write,
	.valid2_write,
	.valid3_write,
	.valid0_out,
	.valid1_out,
	.valid2_out,
	.valid3_out,
	.valid_in,
	.dirty0_write,
	.dirty1_write,
	.dirty2_write,
	.dirty3_write,
	.dirty_in,
	.updateLRU,
	.pmem_write,
	.pmem_read,
	.cpu_resp,
	.wb_sel,
	.adrmux_sel,
	.req(wb2.STB & wb2.CYC),
	.cache_hit_inc,
	.cache_miss_inc,
	.load_adr
);

counter cache_hits
(
	.clk(wb.CLK),
	.increment_count(cache_hit_inc),
	//.clear(clear_cache_hits),
	.clear(l2_hit_clear),
	.count_out(cache_hit_cnt)
);

counter cache_misses
(
	.clk(wb.CLK),
	.increment_count(cache_miss_inc),
	//.clear(clear_cache_miss),
	.clear(l2_miss_clear),
	.count_out(cache_miss_cnt)
);

register #(.width(12)) adr_buffer
(
    .clk(wb.CLK),
    .load(load_adr),
    .in(pmem_adr),
    .out(wb.ADR)
);




endmodule : l2cache4way
