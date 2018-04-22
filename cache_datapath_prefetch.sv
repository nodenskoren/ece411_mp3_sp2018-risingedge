import lc3b_types::*;

module cache_datapath_prefetch
(
	input clk,
	input [11:0] mem_address,
	
	input wb_sel,
	
	
	input data0_writeline,
	input data1_writeline,
	input [127:0] pmem_rdata,
	
	input tag0_write,
	input tag1_write,
	
	input valid0_write,
	input valid1_write,
	input valid_in,
	output valid0_out,
	output valid1_out,
	
	input dirty0_write,
	input dirty1_write,
	input dirty_in,
	output dirty0_out,
	output dirty1_out,
	
	input updateLRU,
	output LRU_out,
	
	output hit0,
	output hit1,
	
	output [127:0] pmem_wdata,
	input [127:0] cpu_wdata,
	output [127:0] cpu_rdata,
	
	input lc3b_word offset_sel,
	input [1:0] adrmux_sel,
	output [11:0] pmem_adr,
	input adr_in_sel,
	input load_prefetch

);

logic [11:3] tag0_out, tag1_out;
//logic valid0_out, valid1_out;
logic [127:0] data0_lineout, data1_lineout;
logic [11:0] prefetch_adr;
logic [11:0] mem_adr_out;

assign hit0 = (mem_adr_out[11:3] == tag0_out) && valid0_out;
assign hit1 = (mem_adr_out[11:3] == tag1_out) && valid1_out;

/*dataArray data0
(
	.clk,
	.writeline(data0_writeline),
	.index(mem_address[2:0]),
	.linein(pmem_rdata),
	.lineout(data0_lineout)
);

dataArray data1
(
	.clk,
	.writeline(data1_writeline),
	.index(mem_address[2:0]),
	.linein(pmem_rdata),
	.lineout(data1_lineout)
);*/
logic [127:0] line_in, dirtyline;


register #(.width(12)) prefetch_adr_register
(
    .clk,
    .load(load_prefetch),
    .in(mem_address + 1'b1),
    .out(prefetch_adr)
);

mux2 #(.width(12)) input_adr_mux
(
	.sel(adr_in_sel),
	.a(mem_address),
	.b(prefetch_adr),
	.f(mem_adr_out)
);

cache_writeword updateline
(
	.curline(cpu_rdata),
	.newline(cpu_wdata),
	.sel(offset_sel),
	.out(dirtyline)
);

mux2 #(.width(128)) wbsel_mux
(
	.sel(wb_sel),
	.a(pmem_rdata),
	.b(dirtyline),
	.f(line_in)
);

array #(.width(128)) data0
(
	.clk,
	.write(data0_writeline),
	.index(mem_adr_out[2:0]),
	.datain(line_in),
	.dataout(data0_lineout)
);

array #(.width(128)) data1
(
	.clk,
	.write(data1_writeline),
	.index(mem_adr_out[2:0]),
	.datain(line_in),
	.dataout(data1_lineout)
);

array #(.width(9)) tag0
(
	.clk,
	.write(tag0_write),
	.index(mem_adr_out[2:0]),
	.datain(mem_adr_out[11:3]),
	.dataout(tag0_out)
);

array #(.width(9)) tag1
(
	.clk,
	.write(tag1_write),
	.index(mem_adr_out[2:0]),
	.datain(mem_adr_out[11:3]),
	.dataout(tag1_out)
);

array valid0
(
	.clk,
	.write(valid0_write),
	.index(mem_adr_out[2:0]),
	.datain(valid_in),
	.dataout(valid0_out)
);

array valid1
(
	.clk,
	.write(valid1_write),
	.index(mem_adr_out[2:0]),
	.datain(valid_in),
	.dataout(valid1_out)
);

array dirty0
(
	.clk,
	.write(dirty0_write),
	.index(mem_adr_out[2:0]),
	.datain(dirty_in),
	.dataout(dirty0_out)
);

array dirty1
(
	.clk,
	.write(dirty1_write),
	.index(mem_adr_out[2:0]),
	.datain(dirty_in),
	.dataout(dirty1_out)
);

array LRU
(
	.clk,
	.write(updateLRU),
	.index(mem_adr_out[2:0]),
	.datain(~LRU_out),
	.dataout(LRU_out)
);


mux4 #(.width(128))wb2_mux
(
	.sel({hit1,hit0}),
	.b(data0_lineout),
	.c(data1_lineout),
	.d(data0_lineout),
	.f(cpu_rdata)
);

mux2 #(.width(128)) evict_mux
(
	.sel(LRU_out),
	.a(data0_lineout),
	.b(data1_lineout),
	.f(pmem_wdata)
);

mux4 #(.width(12)) adrmux
(
	.sel(adrmux_sel),
	.a(mem_adr_out),
	.b({tag0_out, mem_adr_out[2:0]}),
	.c({tag1_out, mem_adr_out[2:0]}),
	.f(pmem_adr)
);





endmodule : cache_datapath_prefetch