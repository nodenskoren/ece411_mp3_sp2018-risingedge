import lc3b_types::*;

module control_rom
(
	input lc3b_opcode opcode,
	input logic imm_mode,
	output lc3b_control_word ctrl,
	output logic offset_sel,
	output logic sr2mux_sel
);

always_comb
begin
	ctrl.opcode = opcode;
	ctrl.load_cc = 1'b0;
	ctrl.is_br = 1'b0;
	//ctrl.is_j = 1'b0;
	sr2mux_sel = 1'b0;
	offset_sel = 1'b0;
	ctrl.aluop = alu_add;
	ctrl.regfilemux_sel = 2'b00;
	ctrl.alumux_sel = 2'b00;
	ctrl.load_regfile = 1'b0;
	ctrl.mem_read = 1'b0;
	ctrl.mem_write = 1'b0;
	
	case(opcode)
		op_add: begin
			ctrl.aluop = alu_add;
			ctrl.load_cc = 1'b1;
			ctrl.load_regfile = 1'b1;			
			if(imm_mode == 1)
				sr2mux_sel = 1'b1;
		end
		op_and: begin
			ctrl.aluop = alu_and;
			ctrl.load_cc = 1'b1;
			ctrl.load_regfile = 1'b1;
			if(imm_mode == 1)
				sr2mux_sel = 1'b1;
		end
		op_not: begin
			ctrl.aluop = alu_not;
			ctrl.load_cc = 1'b1;
			ctrl.load_regfile = 1'b1;
		end
		op_ldr: begin
			ctrl.aluop = alu_add;
			ctrl.load_cc = 1'b1;
			ctrl.alumux_sel = 2'b01;
			ctrl.load_regfile = 1'b1;
			ctrl.regfilemux_sel = 2'b01;
			ctrl.mem_read = 1'b1;
		end
		op_str: begin
			ctrl.aluop = alu_add;
			ctrl.alumux_sel = 2'b01;
			ctrl.mem_write = 1'b1;
		end
		op_br: begin
			//ctrl.alumux_sel = 2'b10;
			ctrl.is_br = 1'b1;
		end
		default: begin
			ctrl = 0;
		end
	endcase
end
endmodule : control_rom