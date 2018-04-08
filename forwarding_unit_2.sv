import lc3b_types::*;

module forwarding_unit_2
(

	input logic regwrite_EX,
	input logic regwrite_MEM,
	input lc3b_reg register_num,
	input lc3b_reg destreg_EX,
	input lc3b_reg destreg_MEM,
	input lc3b_opcode operation,
	input logic imm_mode,
	output logic [1:0] forwarding_unit_out
);


always_comb
begin
	if (imm_mode == 0 && (operation == op_add || operation == op_and)) begin
		if (regwrite_MEM && !(regwrite_EX &&(destreg_EX == register_num)) && (destreg_MEM == register_num))
			forwarding_unit_out = 2'b01;	
		else if (regwrite_EX && (destreg_EX == register_num))
			forwarding_unit_out = 2'b10;
		else
			forwarding_unit_out = 2'b00;
	end
	else begin
		forwarding_unit_out = 2'b00;
	end
end
	
endmodule : forwarding_unit_2