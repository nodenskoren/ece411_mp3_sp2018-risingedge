module wb2sel_4way #(parameter width = 128)
(
	input logic hit0, hit1, hit2, hit3,
	input [width-1:0] a, b, c, d,
	output logic [width-1:0] f
);


always_comb
begin
	/*case(sel)
		2'b00:
			f = a;
		2'b01:
			f = b;
		2'b10:
			f = c;
		2'b11:
			f = d;
		default: /* nothing */;
	//endcase
	if (hit3) f = d;
	else if (hit2) f = c;
	else if (hit1) f = b;
	else if (hit0) f = a;
	else f = 16'hZZZZ;
	
end
	
endmodule : wb2sel_4way
