import lc3b_types::*;

module forwarding_unit_3
(

	input logic regwrite_EX,
	input logic regwrite_MEM,
	input lc3b_reg register_num,
	input lc3b_opcode operation,
	input lc3b_reg destreg_EX,
	input lc3b_reg destreg_MEM,
	output logic [1:0] forwarding_unit_out
);


always_comb
begin
	if ((operation != op_jmp) && (operation != op_jsr) && (operation != op_lea) && (operation != op_trap) && (operation != op_br)) begin
		if (regwrite_EX && (destreg_EX == register_num))
			forwarding_unit_out = 2'b10;		
		else if (regwrite_MEM  && !(regwrite_EX && (destreg_EX == register_num)) && (destreg_MEM == register_num))
			forwarding_unit_out = 2'b01;	
		else
			forwarding_unit_out = 2'b00;
	end
	
	else begin
		forwarding_unit_out = 2'b00;
	end
end
	
endmodule : forwarding_unit_3
