import lc3b_types::*;

module mp1
(
    input clk,

    /* Memory signals */
    input mem_resp,
    input lc3b_word mem_rdata,
    output mem_read,
    output mem_write,
    output lc3b_mem_wmask mem_byte_enable,
    output lc3b_word mem_address,
    output lc3b_word mem_wdata,
	 input lc3b_word ifetch_rdata,
	 input ifetch_resp,
	 output ifetch_read,
	 output lc3b_word ifetch_address
);

lc3b_opcode dp_opcode;
lc3b_control_word c_ctrl;
logic dp_imm_mode;
logic c_offset_sel;
logic c_sr2mux_sel;
datapath the_datapath
(
	.clk,
	.mem_rdata(mem_rdata),
	.mem_resp(mem_resp),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.mem_wdata(mem_wdata),
	.mem_address(mem_address),
	.mem_byte_enable(mem_byte_enable),
	.ifetch_rdata(ifetch_rdata),
	.ifetch_resp(ifetch_resp),
	.ifetch_read(ifetch_read),
	.ifetch_address(ifetch_address),
	
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

endmodule : mp1
