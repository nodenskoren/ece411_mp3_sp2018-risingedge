import lc3b_types::*;

module cache
(
	wishbone.slave wb_cpu,
	//wishbone.master wb_mem
	
	input [127:0] mem_dats,
	input mem_ack,
	input mem_rty,
	
	output logic [127:0] mem_datm,
	output logic mem_cyc,
	output logic mem_stb,
	output logic mem_we,
	output logic [15:0] mem_sel,
	output logic [11:0] mem_adr,
	
	output logic [15:0] cache_hit_cnt, cache_miss_cnt,
	input logic hit_clear, miss_clear

);

logic cpu_resp;
logic [127:0] cpu_data, pmem_wdata;
logic pmem_write, pmem_read;
logic [15:0] pmem_sel;

logic [11:0] pmem_adr;

/* slave outputs to CPU */
assign wb_cpu.DAT_S = cpu_data;
assign wb_cpu.ACK = cpu_resp;
assign wb_cpu.RTY = wb_cpu.STB & wb_cpu.CYC & (!cpu_resp);

/* master outputs to pmem */
assign mem_datm = pmem_wdata;
assign mem_cyc = pmem_write | pmem_read;
assign mem_stb = pmem_write | pmem_read;
assign mem_we = pmem_write;
assign mem_sel = 16'hFFFF;	//always write full line
//assign mem_adr = pmem_adr;


logic dirty0_out, dirty1_out, valid1_out, valid0_out;
logic hit0, hit1;
logic LRU_out;
logic data0_writeword, data1_writeword, data0_writeline, data1_writeline;
logic tag0_write, tag1_write;
logic valid0_write, valid1_write, valid_in;
logic dirty0_write, dirty1_write, dirty_in;
logic updateLRU;
logic wb_sel;
logic [1:0] adrmux_sel;
logic cache_hit_inc, cache_miss_inc;
logic load_adr;



cache_datapath cache_datapath
(
	.clk(wb_cpu.CLK),
	.mem_address(wb_cpu.ADR),
	.data0_writeline,
	.data1_writeline,
	.pmem_rdata(mem_dats),
	.tag0_write,
	.tag1_write,
	.valid0_write,
	.valid1_write,
	.valid0_out,
	.valid1_out,
	.valid_in,
	.dirty0_write,
	.dirty1_write,
	.dirty_in,
	.dirty0_out,
	.dirty1_out,
	.updateLRU,
	.LRU_out,
	.hit0,
	.hit1,
	.pmem_wdata,
	.cpu_wdata(wb_cpu.DAT_M),
	.cpu_rdata(cpu_data),
	.wb_sel,
	.offset_sel(wb_cpu.SEL),
	.adrmux_sel,
	.pmem_adr
);


cache_control cache_controller
(
	.clk(wb_cpu.CLK),
	.readwrite(wb_cpu.WE),
	.dirty0_out,
	.dirty1_out,
	.hit0,
	.hit1,
	.LRU_out,
	.pmem_resp(mem_ack),
	.data0_writeword,
	.data1_writeword,
	.data0_writeline,
	.data1_writeline,
	.tag0_write,
	.tag1_write,
	.valid0_write,
	.valid1_write,
	.valid0_out,
	.valid1_out,
	.valid_in,
	.dirty0_write,
	.dirty1_write,
	.dirty_in,
	.updateLRU,
	.pmem_write,
	.pmem_read,
	.cpu_resp,
	.wb_sel,
	.adrmux_sel,
	.req(wb_cpu.STB & wb_cpu.CYC),
	.cache_hit_inc,
	.cache_miss_inc,
	.load_adr
);

counter cache_hits
(
	.clk(wb_cpu.CLK),
	.increment_count(cache_hit_inc),
	.clear(hit_clear),
	.count_out(cache_hit_cnt)
);

counter cache_misses
(
	.clk(wb_cpu.CLK),
	.increment_count(cache_miss_inc),
	.clear(miss_clear),
	.count_out(cache_miss_cnt)
);

register #(.width(12)) adr_buffer
(
    .clk(wb_cpu.CLK),
    .load(load_adr),
    .in(pmem_adr),
    .out(mem_adr)
);


endmodule : cache
