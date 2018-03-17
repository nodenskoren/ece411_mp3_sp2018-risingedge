import lc3b_types::*;

module l2cache
(
	//input clk,
	wishbone.slave wb2,
	wishbone.master wb
	//wishbone.slave wb2

);

logic cpu_resp;
logic [127:0] cpu_data, pmem_wdata;
logic pmem_write, pmem_read;
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
assign wb.ADR = pmem_adr;
//assign wb.ADR = {wb2.ADR[15:3], 3'b000};


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



cache_datapath cache_datapath
(
	.clk(wb.CLK),
	.mem_address(wb2.ADR),
	.data0_writeline,
	.data1_writeline,
	.pmem_rdata(wb.DAT_S),
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
	.cpu_wdata(wb2.DAT_M),
	.cpu_rdata(cpu_data),
	.wb_sel,
	.offset_sel(wb2.SEL),
	.adrmux_sel,
	.pmem_adr
);


cache_control cache_controller
(
	.clk(wb.CLK),
	.readwrite(wb2.WE),
	.dirty0_out,
	.dirty1_out,
	.hit0,
	.hit1,
	.LRU_out,
	.pmem_resp(wb.ACK),
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
	.req(wb2.STB & wb2.CYC)
);




endmodule : l2cache