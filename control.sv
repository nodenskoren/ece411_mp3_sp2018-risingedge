import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module control
(
    /* Input and output port declarations */
    input clk,
	 
	 /* Datapath controls */
	 input lc3b_opcode opcode,
	 input logic branch_enable,
	 input logic jsr_operation,
	 input logic [1:0] shf_operation,
	 input stb_mode,
	 output logic load_pc,
	 output logic load_ir,
	 output logic load_regfile,
	 output logic load_mar,
	 output logic load_mdr,
	 output logic load_cc,
	 output logic [2:0] pcmux_sel,
	 output logic storemux_sel,
	 output logic [1:0] alumux_sel,
	 output logic [2:0] regfilemux_sel,
	 output logic [1:0] marmux_sel,
	 output logic [1:0] mdrmux_sel,
	 output lc3b_aluop aluop,
	 /*et cetera */
	 output lc3b_reg register_r7,
	 output logic destmux_sel,
	 
	 /* Memory signals */
	 input mem_resp,
	 output logic mem_read,
	 output logic mem_write,
	 output lc3b_mem_wmask mem_byte_enable
);

enum int unsigned {
    /* List of states */
	 fetch1,
	 fetch2,
	 fetch3,
	 decode,
	 s_add,
	 s_and,
	 s_not,
	 s_br,
	 s_br_taken,
	 s_calc_addr,
	 s_ldr1,
	 s_ldr2,
	 s_str1,
	 s_str2,
	 s_jmp,
	 s_lea,
	 s_prejsr,
	 s_jsrr,
	 s_jsr,
	 s_shf,
	 s_sll,
	 s_srl,
	 s_sra,
	 s_calc_addr_2,
	 s_ldi1,
	 s_ldi2,
	 s_ldi3,
	 s_ldi4,
	 s_sti1,
	 s_sti2,
	 s_sti3,
	 s_sti4,
	 s_ldb1,
	 s_ldb2,
	 s_stb1,
	 s_stb2,
	 s_stb3,
	 
	 s_calc_addr_3,
	 s_trap1,
	 s_trap2
} state, next_state;

always_comb
begin : state_actions
    /* Default output assignments */
    load_pc = 1'b0;
	 load_ir = 1'b0;
	 load_regfile = 1'b0;
	 load_mar = 1'b0;
	 load_mdr = 1'b0;
	 load_cc = 1'b0;
	 pcmux_sel = 2'b000;
	 storemux_sel = 1'b0;
	 alumux_sel = 2'b00;
	 regfilemux_sel = 3'b000;
	 marmux_sel = 2'b00;
	 mdrmux_sel = 2'b00;
	 aluop = alu_add;
	 mem_read = 1'b0;
	 mem_write = 1'b0;
	 mem_byte_enable = 2'b11;
	 register_r7 = 3'b111;
	 destmux_sel = 1'b0;	 
	 
    /* Actions for each state */
	 case(state)
	 	 fetch1: begin
	 	 	 /* MAR ← PC; PC ← PC + 2; */
	 	 	 marmux_sel = 2'b01;
	 	 	 load_mar = 1;
	 	 	 pcmux_sel = 2'b000;
	 	 	 load_pc = 1;
	 	 end
		
	 	 fetch2: begin
	 	 	 /* while (mem_resp == 0), MDR ← M[MAR]; */
	 	 	 mdrmux_sel = 1;
			 load_mdr = 1;
			 mem_read = 1; 	 	 
	 	 end
		
	 	 fetch3: begin
	 	 	 /* IR ← MDR; */
	 	 	 load_ir = 1;
	 	 end
		
	 	 decode: /* Do nothing */;	 
	 	 s_add: begin
	 	 	 /* DR ← SRA + SRB */
	 	 	 aluop = alu_add;
	 	 	 load_regfile = 1;
	 	 	 regfilemux_sel = 3'b000;
	 	 	 load_cc = 1;
	 	 end

		 s_and: begin
	 	 	 /* DR ← SRA & SRB */
	 	 	 aluop = alu_and;
	 	 	 load_regfile = 1;
	 	 	 load_cc = 1;
	 	 end
		 
		 s_not: begin
	 	 	 /* DR ← NOT(A) */
	 	 	 aluop = alu_not;
	 	 	 load_regfile = 1;
	 	 	 load_cc = 1;
	 	 end
		 
		 s_br: /* NONE */ ;		 	 
		 s_br_taken: begin
		 	 /* PC ← PC + SEXT(IR[8:0] « 1); */
		 	 pcmux_sel = 3'b001;
		 	 load_pc = 1;
		 end

		 s_calc_addr: begin
			 /* MAR ← A + SEXT(IR[5:0] « 1); */
			 alumux_sel = 2'b01;
			 aluop = alu_add;
			 load_mar = 1;
		 end
		 
		 s_ldr1: begin
		 	 /* MDR ← M[MAR]; */
		 	 mdrmux_sel = 1;
		 	 load_mdr = 1;
		 	 mem_read = 1;
		 end
		 
		 s_ldr2: begin
		 	 /* DR ← MDR; */
		 	 regfilemux_sel = 3'b001;
		 	 load_regfile = 1;
		 	 load_cc = 1;
		 end
		 
		 s_str1: begin
		 	 /* MDR ← SR; */		 
			 storemux_sel = 1;
			 aluop = alu_pass;
			 load_mdr = 1;
		 end

		 s_str2: begin
		 	 /* M[MAR] ← MDR; */		 
			 mem_write = 1;
		 end
			 
		 s_jmp: begin
		 	 /* PC ← BaseR */
			 pcmux_sel = 2'b010;
			 storemux_sel = 0;
			 load_pc = 1;
		 end
		 
		 s_lea: begin
		 	 /* DR ← PC + (SEXT(PCoffset9) << 1); setcc(); */
			 pcmux_sel = 2'b001;
			 regfilemux_sel = 3'b010;
			 load_regfile = 1;
			 load_cc = 1;
		 end
		 
		 s_prejsr: begin
		 	 /* R7 ← PC; */
			 regfilemux_sel = 3'b011;
			 load_regfile = 1;
			 destmux_sel = 1;
		 end
		 
		 s_jsr: begin
		 	 /* PC ← PC + (SEXT(PCoffset11) << 1); */
			 pcmux_sel = 3'b011;
			 load_pc = 1;
		 end
		 
		 s_jsrr: begin
		 	 /* PC ← BaseR; */
			 pcmux_sel = 3'b010;
			 load_pc = 1;
		 end
		 
		 s_shf: /* Do nothing */;
		 
		 s_sll: begin
		 	 alumux_sel = 2'b10;
			 aluop = alu_sll;
			 load_regfile = 1;
	 	 	 load_cc = 1;
		 end
		 
		 s_srl: begin
		 	 alumux_sel = 2'b10;		 
			 aluop = alu_srl;
			 load_regfile = 1;
	 	 	 load_cc = 1;
		 end
		 
		 s_sra: begin
		 	 alumux_sel = 2'b10;		 
			 aluop = alu_sra;
			 load_regfile = 1;
	 	 	 load_cc = 1;
		 end
		 
		 s_calc_addr_2: begin
			 alumux_sel = 2'b11;
			 aluop = alu_add;
			 load_mar = 1;
		 end	
		 
		 s_stb1: begin
			 storemux_sel = 1;
			 if(stb_mode == 1)
				 mdrmux_sel = 2'b10;
			 else
				 mdrmux_sel = 2'b00;
			 aluop = alu_pass;
			 load_mdr = 1;
		 end
		 
		 s_stb2: begin
			 mem_write = 1;
			 mem_byte_enable = 2'b01;
		 end

		 s_stb3: begin
			 mem_write = 1;
			 mem_byte_enable = 2'b10;
		 end
		 
		 s_ldb1: begin
			 if(stb_mode == 1)
				 mdrmux_sel = 2'b11;
			 else
				 mdrmux_sel = 2'b01;
			 load_mdr = 1;
			 mem_read = 1;
		 end
		 
		 s_ldb2: begin
			 regfilemux_sel = 3'b100;
			 load_regfile = 1;
			 load_cc = 1;
		 end
		 
		 s_ldi1: begin
			 mdrmux_sel = 2'b01;
			 load_mdr = 1;
			 mem_read = 1;
		 end
		 
		 s_ldi2: begin
			 marmux_sel = 2'b10;
			 load_mar = 1;
		 end
		 
		 s_ldi3: begin
			 mdrmux_sel = 2'b01;
			 load_mdr = 1;
			 mem_read = 1;
		 end
		 
		 s_ldi4: begin
			 regfilemux_sel = 3'b001;
			 load_regfile = 1;
			 load_cc = 1;
		 end
		 
		 s_sti1: begin
			 mdrmux_sel = 2'b01;
			 load_mdr = 1;
			 mem_read = 1;
		 end
		 
		 s_sti2: begin
			 marmux_sel = 2'b10;
			 load_mar = 1;
		 end
		 
		 s_sti3: begin
			 storemux_sel = 1;
			 aluop = alu_pass;
			 load_mdr = 1;
		 end
		 
		 s_sti4: begin
			 mem_write = 1;
		 end
		 
		 s_calc_addr_3: begin
			 marmux_sel = 2'b11;
			 load_mar = 1;
		 end
		 
		 s_trap1: begin
		 /* MDR ← M[MAR]; R7 ← PC; */
			 mdrmux_sel = 2'b01;
			 load_mdr = 1;
			 mem_read = 1;
			 destmux_sel = 1;
			 regfilemux_sel = 3'b011;
			 load_regfile = 1;
		 end
		 
		 s_trap2: begin
		 /* PC ← MDR */
			 pcmux_sel = 3'b100;
			 load_pc = 1;
		 end
		 
	 	 default: /* Do nothing */;		 
	 endcase
end

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
    next_state = state;
	 
	 case(state)
	 	 fetch1: begin
	 	 	 next_state = fetch2;
	 	 end
		 	 	 
		 fetch2: begin
		 	 if(mem_resp == 1'b1)
	 	 	 	 next_state = fetch3;
	 	 end
		 
		 fetch3: begin
		 	 next_state = decode;
	 	 end
		 
		 decode: begin
		 	 case(opcode)
	 	 	 	 op_add: begin
				 	 next_state = s_add;
				 end
				 
				 op_and: begin
				 	 next_state = s_and;
				 end
				 
				 op_not: begin
				 	 next_state = s_not;
				 end
				 
				 op_br: begin
				 	 next_state = s_br;
				 end
				 
				 op_ldr: begin
				 	 next_state = s_calc_addr;
				 end
				 
				 op_str: begin
				 	 next_state = s_calc_addr;
				 end
				 
				 op_jmp: begin
				 	 next_state = s_jmp;
				 end
				 
				 op_lea: begin
				 	 next_state = s_lea;
				 end
				 
				 op_jsr: begin
				 	 next_state = s_prejsr;
				 end
				 
				 op_shf: begin
					 next_state = s_shf;
				 end
				 
				 op_ldi: begin
					 next_state = s_calc_addr;
				 end
				 
				 op_sti: begin
					 next_state = s_calc_addr;
				 end
				 
				 op_ldb: begin
					 next_state = s_calc_addr_2;
				 end
				 
				 op_stb: begin
					 next_state = s_calc_addr_2;
				 end
				 
				 op_trap: begin
					 next_state = s_calc_addr_3;
				 end
				 
				 default: /* Do nothing */;
		 	 endcase
		 end

		 s_add: begin
		 	 next_state = fetch1;
	 	 end	 

		 s_and: begin
		 	 next_state = fetch1;
	 	 end

		 s_not: begin
		 	 next_state = fetch1;
	 	 end
		 
		 s_calc_addr: begin
		 	 case(opcode)
			 	 op_ldr: begin
				 	 next_state = s_ldr1;
		 	 	 end
				 
				 op_str: begin
				 	 next_state = s_str1;
				 end
				 
				 op_ldi: begin
					 next_state = s_ldi1;
				 end
				 
				 op_sti: begin
					 next_state = s_sti1;
				 end
				 
				 default: /* Do nothing */;
			 endcase
		 end
		 
		 s_calc_addr_2: begin
		 	 case(opcode)
			 	 op_ldb: begin
				 	 next_state = s_ldb1;
		 	 	 end
				 
				 op_stb: begin
				 	 next_state = s_stb1;
				 end
				 
				 default: /* Do nothing */;				 
			 endcase
		 end
				
		 /* ldi states */
		 s_ldi1: begin
			 if(mem_resp == 1)
				next_state = s_ldi2;
			 else
				next_state = s_ldi1;
		 end
		 
		 s_ldi2: begin
			 next_state = s_ldi3;
		 end
		 
		 s_ldi3: begin
			 if(mem_resp == 1)
				 next_state = s_ldi4;
			 else
				 next_state = s_ldi3;
		 end
		 
		 s_ldi4: begin
			 next_state = fetch1;
		 end
		 
		 /* ldb states */
		 s_ldb1: begin
			 if(mem_resp == 1)
			 	next_state = s_ldb2;
			 else
				next_state = s_ldb1;
		 end
		 
		 s_ldb2: begin
			 next_state = fetch1;
		 end		 
		 
		 /* sti states */
		 s_sti1: begin
			 if(mem_resp == 1)
				next_state = s_sti2;
			 else
				next_state = s_sti1;
		 end
		 
		 s_sti2: begin
			 next_state = s_sti3;
		 end
		 
		 s_sti3: begin
			 next_state = s_sti4;
		 end
		 
		 s_sti4: begin
			 if(mem_resp == 1)
			 	 next_state = fetch1;
			 else
				 next_state = s_sti4;
		 end
		 
		 /* ldb states */
		 s_stb1: begin
			 if(stb_mode == 0)
			 	next_state = s_stb2;
			 else
				next_state = s_stb3;
		 end
		 
		 s_stb2: begin
			 if(mem_resp == 1)
			 	next_state = fetch1;
			 else
				next_state = s_stb2;
		 end

		 s_stb3: begin
			 if(mem_resp == 1)
				next_state = fetch1;
			 else
				next_state = s_stb3;
		 end
		 
		 /* ldr states */
		 s_ldr1: begin
		 	 if(mem_resp == 1'b1)
		 	 	 next_state = s_ldr2;
		 end
		
		 s_ldr2: begin
		 	 next_state = fetch1;
		 end
		
		 /* str states */
		 s_str1: begin
		 	 next_state = s_str2;
		 end
		
		 s_str2: begin
		 	 if(mem_resp == 1'b1)
		 	 	 next_state = fetch1;
		 end
		 
		 /* br states */
		 s_br: begin
		 	 if(branch_enable == 1'b1)
			 	 next_state = s_br_taken;
			 else
			 	 next_state = fetch1;
		 end
		 
		 s_br_taken: begin
		 	 next_state = fetch1;
		 end
		 
		 /* jmp state */
		 s_jmp: begin
		 	 next_state = fetch1;
		 end
		 
		 s_lea: begin
		 	 next_state = fetch1;
		 end

		 s_prejsr: begin
		 	 if(jsr_operation == 1'b0)
				 next_state = s_jsrr;
			 else
				 next_state = s_jsr;
		 end
		 
		 s_jsrr: begin
		 	 next_state = fetch1;
		 end

		 s_jsr: begin
		 	 next_state = fetch1;
		 end		 
		 
		 /* shf states */
		 s_shf: begin
		 	 if(shf_operation == 2'b00 || shf_operation == 2'b10)
			 	 next_state = s_sll;
			 else
			 	 if(shf_operation == 2'b01)
				 	 next_state = s_srl;
				 else
				 	 next_state = s_sra;
		 end
		 
		 s_sll: begin
		 	 next_state = fetch1;
		 end
		 
		 s_srl: begin
		 	 next_state = fetch1;
		 end
		 
		 s_sra: begin
		 	 next_state = fetch1;
		 end
		 
		 /* trap states */
		 s_calc_addr_3: begin
			 next_state = s_trap1;
		 end
		 
		 s_trap1: begin
			 if(mem_resp == 1)
				next_state = s_trap2;
			 else
				next_state = s_trap1;
		 end
		 
		 s_trap2: begin
			 next_state = fetch1;
		 end
		 
		 default: /* Do nothing */;
	 endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_state;
end

endmodule : control
