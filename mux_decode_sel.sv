module mux_decode_sel #(parameter width = 16)
(
	input logic [3:0] sel,
	input [width-1:0] a, b, c, d,
	output logic [width-1:0] f
);

// 010 - jmp, jsrr
// 110 - jsr
// 001 - br
// default - pc + 2
always_comb
begin
	case(sel)
		4'b0010:
			f = b;
		4'b1100:
			f = b;
		4'b0100:
			f = c;
		4'b0001:
			f = d;
		default:
			f = a;
	endcase
end
	
endmodule : mux_decode_sel
