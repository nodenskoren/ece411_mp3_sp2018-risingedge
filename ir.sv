import lc3b_types::*;

module ir
(
    input clk,
    input load,
    input lc3b_word in,
    output lc3b_opcode opcode,
    output lc3b_reg dest, src1, src2,
    output lc3b_offset6 offset6,
    output lc3b_offset9 offset9,
	 output lc3b_imm4 imm4_out,
	 output lc3b_imm5 imm5_out,
	 output lc3b_imm11 imm11_out,
	 output logic sr2mux_sel,
	 output logic jsr_operation,
	 output logic [1:0] shf_operation,
	 output lc3b_trapvect8 trapvect8
);

lc3b_word data;

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data = in;
    end
end

always_comb
begin
    opcode = lc3b_opcode'(data[15:12]);

    dest = data[11:9];
    src1 = data[8:6];
    src2 = data[2:0];

    offset6 = data[5:0];
    offset9 = data[8:0];
	 imm4_out = data[3:0];
	 imm5_out = data[4:0];
	 imm11_out = data[10:0];
	 sr2mux_sel = data[5];
	 jsr_operation = data[11];
	 shf_operation = data[5:4];
	 trapvect8 = data[7:0];
	 
end

endmodule : ir
