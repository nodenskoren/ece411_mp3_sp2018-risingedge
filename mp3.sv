import lc3b_types::*;

module mp3
(
    /* Memory signals */
	 wishbone.master ifetch,
	 wishbone.master memory,
	 
	 input logic [15:0] dcache_hits, dcache_misses,
	 input logic [15:0] icache_hits, icache_misses,
	 input logic [15:0] l2_hits, l2_misses,
	 output logic dcache_hit_clear, dcache_miss_clear,
	 output logic icache_hit_clear, icache_miss_clear,
	 output logic l2_hit_clear, l2_miss_clear
);

lc3b_opcode dp_opcode;
lc3b_control_word c_ctrl;
logic dp_imm_mode;
logic dp_jsr_mode;
logic [1:0] dp_shf_mode;
logic c_offset_sel;
logic c_sr2mux_sel;
logic c_destmux_sel;
logic c_is_ldb_stb;

logic dp_mem_read;
logic dp_ifetch_read;

datapath the_datapath
(
	.clk(memory.CLK),
	.mem_rdata(memory.DAT_S),
	.mem_resp(memory.ACK),
	.mem_read(dp_mem_read),
	.mem_write(memory.WE),
	.mem_wdata(memory.DAT_M),
	.mem_address(memory.ADR),
	.mem_sel(memory.SEL),
	.ifetch_rdata(ifetch.DAT_S),
	.ifetch_resp(ifetch.ACK),
	.ifetch_read(dp_ifetch_read),
	.ifetch_address(ifetch.ADR),
	
	.imm_mode(dp_imm_mode),
	.jsr_mode(dp_jsr_mode),
	.shf_mode(dp_shf_mode),
	.opcode(dp_opcode),
	.ctrl_in(c_ctrl),
	.offset_sel(c_offset_sel),
	.sr2mux_sel(c_sr2mux_sel),
	.destmux_sel(c_destmux_sel),
	.is_ldb_stb(c_is_ldb_stb),
	
	.c10_out(dcache_hits),
	.c11_out(dcache_misses),
	.c12_out(icache_hits),
	.c13_out(icache_misses),
	.c14_out(l2_hits),
	.c15_out(l2_misses),
	
	.c10_clear(dcache_hit_clear),
	.c11_clear(dcache_miss_clear),
	.c12_clear(icache_hit_clear),
	.c13_clear(icache_miss_clear),
	.c14_clear(l2_hit_clear),
	.c15_clear(l2_miss_clear)
);

control_rom control_rom
(
	.opcode(dp_opcode),
	.imm_mode(dp_imm_mode),
	.jsr_mode(dp_jsr_mode),
	.ctrl(c_ctrl),
	.offset_sel(c_offset_sel),
	.sr2mux_sel(c_sr2mux_sel),
	.destmux_sel(c_destmux_sel),
	.shf_mode(dp_shf_mode),
	.is_ldb_stb(c_is_ldb_stb)
);

assign memory.CYC = memory.WE | dp_mem_read;
assign memory.STB = memory.WE | dp_mem_read;
assign ifetch.CYC = ifetch.WE | dp_ifetch_read;
assign ifetch.STB = ifetch.WE | dp_ifetch_read;

assign ifetch.DAT_M = 128'h00000000000000000000000000000000;
assign ifetch.WE = 0;
assign ifetch.SEL = 16'h0000;

endmodule : mp3