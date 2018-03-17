module offset_select
(
	input logic is_second_access,
	input logic addr_sel_bit0,
	input [3:0] alu_out, trap_out, ldi_sti_out,
	output logic [3:0] mem_offset
);


always_comb
begin
	if (is_second_access)
		mem_offset = ldi_sti_out;
	else if (addr_sel_bit0)
		mem_offset = trap_out;
	else
		mem_offset = alu_out;
end
	
endmodule : offset_select