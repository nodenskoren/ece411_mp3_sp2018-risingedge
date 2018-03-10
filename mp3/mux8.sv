module mux8 #(parameter width = 16)
(
	input logic [2:0] sel,
	input [width-1:0] a, b, c, d, e,
	output logic [width-1:0] out
);


always_comb
begin
	case(sel)
		3'b000:
			out = a;
		3'b001:
			out = b;
		3'b010:
			out = c;
		3'b011:
			out = d;
		3'b100:
			out = e;
		3'b101:
			out = 16'h0000;
		3'b110:
			out = 16'h0000;
		3'b111:
			out = 16'h0000;	
		default: /* nothing */;
	endcase
end
	
endmodule : mux8