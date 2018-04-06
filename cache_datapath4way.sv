import lc3b_types::*;

module cache_datapath4way
(
	input clk,
	input [11:0] mem_address,
	
	input wb_sel,
	
	
	input data0_writeline,
	input data1_writeline,
	input data2_writeline,
	input data3_writeline,
	
	input [127:0] pmem_rdata,
	
	input tag0_write,
	input tag1_write,
	input tag2_write,
	input tag3_write,
	
	input valid0_write,
	input valid1_write,
	input valid2_write,
	input valid3_write,
	input valid_in,
	output valid0_out,
	output valid1_out,
	output valid2_out,
	output valid3_out,
	
	input dirty0_write,
	input dirty1_write,
	input dirty2_write,
	input dirty3_write,
	input dirty_in,
	output dirty0_out,
	output dirty1_out,
	output dirty2_out,
	output dirty3_out,
	
	input updateLRU,
	output [1:0] LRU_out,
	
	output hit0,
	output hit1,
	output hit2,
	output hit3,
	
	output [127:0] pmem_wdata,
	input [127:0] cpu_wdata,
	output [127:0] cpu_rdata,
	
	input lc3b_word offset_sel,
	input [2:0] adrmux_sel,
	output [11:0] pmem_adr

);

logic [11:3] tag0_out, tag1_out, tag2_out, tag3_out;
//logic valid0_out, valid1_out;
logic [127:0] data0_lineout, data1_lineout, data2_lineout, data3_lineout;

assign hit0 = (mem_address[11:3] == tag0_out) && valid0_out;
assign hit1 = (mem_address[11:3] == tag1_out) && valid1_out;
assign hit2 = (mem_address[11:3] == tag2_out) && valid2_out;
assign hit3 = (mem_address[11:3] == tag3_out) && valid3_out;

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
	.index(mem_address[2:0]),
	.datain(line_in),
	.dataout(data0_lineout)
);

array #(.width(128)) data1
(
	.clk,
	.write(data1_writeline),
	.index(mem_address[2:0]),
	.datain(line_in),
	.dataout(data1_lineout)
);

array #(.width(128)) data2
(
	.clk,
	.write(data2_writeline),
	.index(mem_address[2:0]),
	.datain(line_in),
	.dataout(data2_lineout)
);

array #(.width(128)) data3
(
	.clk,
	.write(data3_writeline),
	.index(mem_address[2:0]),
	.datain(line_in),
	.dataout(data3_lineout)
);

array #(.width(9)) tag0
(
	.clk,
	.write(tag0_write),
	.index(mem_address[2:0]),
	.datain(mem_address[11:3]),
	.dataout(tag0_out)
);


array #(.width(9)) tag1
(
	.clk,
	.write(tag1_write),
	.index(mem_address[2:0]),
	.datain(mem_address[11:3]),
	.dataout(tag1_out)
);

array #(.width(9)) tag2
(
	.clk,
	.write(tag2_write),
	.index(mem_address[2:0]),
	.datain(mem_address[11:3]),
	.dataout(tag2_out)
);

array #(.width(9)) tag3
(
	.clk,
	.write(tag3_write),
	.index(mem_address[2:0]),
	.datain(mem_address[11:3]),
	.dataout(tag3_out)
);

array valid0
(
	.clk,
	.write(valid0_write),
	.index(mem_address[2:0]),
	.datain(valid_in),
	.dataout(valid0_out)
);

array valid1
(
	.clk,
	.write(valid1_write),
	.index(mem_address[2:0]),
	.datain(valid_in),
	.dataout(valid1_out)
);

array valid2
(
	.clk,
	.write(valid2_write),
	.index(mem_address[2:0]),
	.datain(valid_in),
	.dataout(valid2_out)
);

array valid3
(
	.clk,
	.write(valid3_write),
	.index(mem_address[2:0]),
	.datain(valid_in),
	.dataout(valid3_out)
);

array dirty0
(
	.clk,
	.write(dirty0_write),
	.index(mem_address[2:0]),
	.datain(dirty_in),
	.dataout(dirty0_out)
);

array dirty1
(
	.clk,
	.write(dirty1_write),
	.index(mem_address[2:0]),
	.datain(dirty_in),
	.dataout(dirty1_out)
);

array dirty2
(
	.clk,
	.write(dirty2_write),
	.index(mem_address[2:0]),
	.datain(dirty_in),
	.dataout(dirty2_out)
);

array dirty3
(
	.clk,
	.write(dirty3_write),
	.index(mem_address[2:0]),
	.datain(dirty_in),
	.dataout(dirty3_out)
);

array #(.width(2)) LRU
(
	.clk,
	.write(updateLRU),
	.index(mem_address[2:0]),
	.datain(~LRU_out),	//must change
	.dataout(LRU_out)
);


/*mux4 #(.width(128))wb2_mux
(
	.sel({hit1,hit0}),
	.b(data0_lineout),
	.c(data1_lineout),
	.d(data0_lineout),
	.f(cpu_rdata)
);*/

wb2sel_4way wb2sel_4way
(
	.hit0,
	.hit1,
	.hit2,
	.hit3,
	.a(data0_lineout),
	.b(data1_lineout),
	.c(data2_lineout),
	.d(data3_lineout),
	.f(cpu_rdata)
);

mux4 #(.width(128)) evict_mux
(
	.sel(!LRU_out),	//must change
	.a(data0_lineout),
	.b(data1_lineout),
	.c(data2_lineout),
	.d(data3_lineout),
	.f(pmem_wdata)
);

mux8 #(.width(12)) adrmux
(
	.sel(adrmux_sel),
	.a(mem_address),
	.b({tag0_out, mem_address[2:0]}),
	.c({tag1_out, mem_address[2:0]}),
	.d({tag2_out, mem_address[2:0])),
	.e({tag3_out, mem_address[2:0]}),
	.f(pmem_adr)
);





endmodule : cache_datapath4way