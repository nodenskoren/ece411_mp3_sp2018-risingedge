import lc3b_types::*;

module mp3
(
    /* Memory signals */
	 wishbone.master ifetch,
	 wishbone.master memory
);

lc3b_opcode dp_opcode;
lc3b_control_word c_ctrl;
logic dp_imm_mode;
logic dp_jsr_mode;
logic dp_stb_byte;
logic [1:0] dp_shf_mode;
logic c_offset_sel;
logic c_sr2mux_sel;
logic c_destmux_sel;
logic c_is_ldb_stb;

logic dp_mem_read;
logic dp_ifetch_read;
logic [1:0] stbregmux_sel;

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
	.stb_byte(dp_stb_byte),
	.ctrl_in(c_ctrl),
	.offset_sel(c_offset_sel),
	.sr2mux_sel(c_sr2mux_sel),
	.destmux_sel(c_destmux_sel),
	.is_ldb_stb(c_is_ldb_stb),
	.stbregmux_sel
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
	.is_ldb_stb(c_is_ldb_stb),
	.stb_byte(dp_stb_byte),
	.stbregmux_sel
);

assign memory.CYC = memory.WE | dp_mem_read;
assign memory.STB = memory.WE | dp_mem_read;
assign ifetch.CYC = ifetch.WE | dp_ifetch_read;
assign ifetch.STB = ifetch.WE | dp_ifetch_read;

assign ifetch.DAT_M = 128'h00000000000000000000000000000000;
assign ifetch.WE = 0;
assign ifetch.SEL = 16'h0000;

endmodule : mp3