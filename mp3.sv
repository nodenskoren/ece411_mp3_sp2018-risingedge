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
logic c_offset_sel;
logic c_sr2mux_sel;

logic dp_mem_read;
logic dp_ifetch_read;

datapath the_datapath
(
	.clk(memory.CLK),
	.mem_rdata(memory.DAT_S),
	.mem_resp(memory.ACK),
	.mem_read(dp_mem_read),
	.mem_write(memory.WE),
	.mem_wdata(memory.DAT_M[15:0]),
	.mem_address(memory.ADR),
	.mem_byte_enable(memory.SEL[1:0]),
	.ifetch_rdata(ifetch.DAT_S),
	.ifetch_resp(ifetch.ACK),
	.ifetch_read(dp_ifetch_read),
	.ifetch_address(ifetch.ADR),
	
	.imm_mode(dp_imm_mode),
	.opcode(dp_opcode),
	.ctrl_in(c_ctrl),
	.offset_sel(c_offset_sel),
	.sr2mux_sel(c_sr2mux_sel)
);

control_rom control_rom
(
	.opcode(dp_opcode),
	.imm_mode(dp_imm_mode),
	.ctrl(c_ctrl),
	.offset_sel(c_offset_sel),
	.sr2mux_sel(c_sr2mux_sel)
);

assign memory.CYC = memory.WE | dp_mem_read;
assign memory.STB = memory.WE | dp_mem_read;
assign ifetch.CYC = ifetch.WE | dp_ifetch_read;
assign ifetch.STB = ifetch.WE | dp_ifetch_read;
assign memory.DAT_M[127:16] = 112'h0000000000000000000000000000;
assign memory.SEL[15:2] = 14'b00000000000000;
assign ifetch.DAT_M = 128'h00000000000000000000000000000000;
assign ifetch.WE = 0;
assign ifetch.SEL = 16'h0000;

endmodule : mp3