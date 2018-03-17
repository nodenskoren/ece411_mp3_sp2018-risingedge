import lc3b_types::*;

module control_rom
(
	input lc3b_opcode opcode,
	input logic imm_mode,
	input logic jsr_mode,
	input logic [1:0] shf_mode,
	output lc3b_control_word ctrl,
	output logic offset_sel,
	output logic sr2mux_sel,
	output logic destmux_sel,
	output logic is_ldb_stb
);

always_comb
begin
	ctrl.opcode = opcode;
	ctrl.load_cc = 1'b0;
	ctrl.is_br = 1'b0;
	ctrl.is_j = 1'b0;
	sr2mux_sel = 1'b0;
	offset_sel = 1'b0;
	destmux_sel = 1'b0;
	ctrl.aluop = alu_add;
	ctrl.regfilemux_sel = 3'b000;
	ctrl.alumux_sel = 2'b00;
	ctrl.load_regfile = 1'b0;
	ctrl.mem_read = 1'b0;
	ctrl.mem_write = 1'b0;
	ctrl.is_jsr = 1'b0;
	ctrl.addr_sel = 2'b00;
	is_ldb_stb = 1'b0;
	ctrl.mem_byte_enable = 2'b11;
	ctrl.is_ldi = 1'b0;
	ctrl.is_sti = 1'b0;
	ctrl.is_trap = 1'b0;
	
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
			ctrl.regfilemux_sel = 3'b001;
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
		op_jmp: begin
			ctrl.aluop = alu_pass;
			ctrl.is_j = 1'b1;
		end
		op_jsr: begin
			ctrl.aluop = alu_pass;
			ctrl.is_j = 1'b1;
			if(jsr_mode == 1)
				ctrl.is_jsr = 1'b1;
			offset_sel = 1'b1;
			destmux_sel = 1'b1;
			ctrl.regfilemux_sel = 3'b010;
			ctrl.load_regfile = 1'b1;
		end
		op_lea: begin
			ctrl.regfilemux_sel = 3'b011;
			ctrl.load_regfile = 1'b1;
			ctrl.load_cc = 1'b1;			
		end
		op_trap: begin
			ctrl.aluop = alu_pass;
			destmux_sel = 1'b1;
			ctrl.addr_sel = 2'b01;
			ctrl.mem_read = 1'b1;
			ctrl.regfilemux_sel = 3'b010;
			ctrl.load_regfile = 1'b1;
			ctrl.is_trap = 1'b1;
		end
		op_shf: begin
			ctrl.load_cc = 1'b1;
			ctrl.alumux_sel = 2'b11;
			ctrl.load_regfile = 1'b1;
			if(shf_mode[0] == 0)
				ctrl.aluop = alu_sll;
			else begin
				if(shf_mode[1] == 0)
					ctrl.aluop = alu_srl;
				else
					ctrl.aluop = alu_sra;
			end
		end
		op_ldb: begin
			is_ldb_stb = 1'b1;
			ctrl.aluop = alu_add;
			ctrl.load_cc = 1'b1;
			ctrl.alumux_sel = 2'b01;
			ctrl.load_regfile = 1'b1;
			ctrl.mem_read = 1'b1;			
			ctrl.regfilemux_sel = 3'b100;
		end
		op_stb: begin
			is_ldb_stb = 1'b1;
			ctrl.aluop = alu_add;
			ctrl.alumux_sel = 2'b01;
			ctrl.mem_write = 1'b1;
			//ctrl.mem_byte_enable = 2'b11;
		end
		op_ldi: begin	
			ctrl.is_ldi = 1'b1;
			ctrl.aluop = alu_add;
			ctrl.load_cc = 1'b1;
			ctrl.alumux_sel = 2'b01;
			ctrl.load_regfile = 1'b1;
			ctrl.mem_read = 1'b1;
			ctrl.regfilemux_sel = 3'b001;			
		end
		
		op_sti: begin
			ctrl.is_sti = 1'b1;
			ctrl.aluop = alu_add;
			ctrl.alumux_sel = 2'b01;
			ctrl.mem_read = 1'b1;
		end	
	
		default: begin
			ctrl = 0;
		end
	endcase
end
endmodule : control_rom