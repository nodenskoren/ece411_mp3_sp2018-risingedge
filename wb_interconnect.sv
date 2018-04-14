import lc3b_types::*;

module wb_interconnect
(
	wishbone.slave ifetch,
	wishbone.slave memory,
	wishbone.master wb_l2
);

logic cache_sel;
logic[127:0] i_datm, d_datm;
logic i_cyc, d_cyc;
logic i_stb, d_stb;
logic i_we, d_we;
logic [15:0] i_sel, d_sel;
logic [11:0] i_adr, d_adr;

l1arbiter arbiter
(
	.clk(wb_l2.CLK),
	.i_rw(i_cyc || i_stb),
	.d_rw(d_cyc || d_stb),
	.mem_resp(wb_l2.ACK),
	.cache_sel
);

cache Icache
(
	.wb_cpu(ifetch),
	.mem_dats(wb_l2.DAT_S),
	.mem_ack(wb_l2.ACK && cache_sel),
	.mem_rty(wb_l2.RTY),
	
	.mem_datm(i_datm),
	.mem_cyc(i_cyc),
	.mem_stb(i_stb),
	.mem_we(i_we),
	.mem_sel(i_sel),
	.mem_adr(i_adr)
);



cache Dcache
(
	.wb_cpu(memory),
	.mem_dats(wb_l2.DAT_S),
	.mem_ack(wb_l2.ACK && !cache_sel),
	.mem_rty(wb_l2.RTY),
	
	.mem_datm(d_datm),
	.mem_cyc(d_cyc),
	.mem_stb(d_stb),
	.mem_we(d_we),
	.mem_sel(d_sel),
	.mem_adr(d_adr)
);


mux2 #(.width(128)) dat_m
(
	.sel(cache_sel),
	.a(d_datm),
	.b(i_datm),
	.f(wb_l2.DAT_M)
);

mux2 #(.width(1)) cyc
(
	.sel(cache_sel),
	.a(d_cyc),
	.b(i_cyc),
	.f(wb_l2.CYC)
);

mux2 #(.width(1)) stb
(
	.sel(cache_sel),
	.a(d_stb),
	.b(i_stb),
	.f(wb_l2.STB)
);

mux2 #(.width(1)) we
(
	.sel(cache_sel),
	.a(d_we),
	.b(i_we),
	.f(wb_l2.WE)
);

mux2 sel
(
	.sel(cache_sel),
	.a(d_sel),
	.b(i_sel),
	.f(wb_l2.SEL)
);

mux2 #(.width(12)) adr
(
	.sel(cache_sel),
	.a(d_adr),
	.b(i_adr),
	.f(wb_l2.ADR)
);

	

endmodule : wb_interconnect