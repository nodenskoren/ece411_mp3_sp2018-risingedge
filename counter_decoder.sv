import lc3b_types::*;

module counter_decoder
(
	input logic clear_counter,
	input logic [3:0] offset,
	output logic c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15
);


always_comb
begin
	c0 = 0;
	c1 = 0;
	c2 = 0;
	c3 = 0;
	c4 = 0;
	c5 = 0;
	c6 = 0;
	c7 = 0;
	c8 = 0;
	c9 = 0;
	c10 = 0;
	c11 = 0;
	c12 = 0;
	c13 = 0;
	c14 = 0;
	c15 = 0;
	if (clear_counter)
	begin
	 case(offset)
		4'b0000:
			c0 = 1;
		4'b0001:
			c1 = 1;
		4'b0010:
			c2 = 1;
		4'b0011:
			c3 = 1;
		4'b0100:
			c4 = 1;
		4'b0101:
			c5 = 1;
		4'b0110:
			c6 = 1;
		4'b0111:
			c7 = 1;	
		4'b1000:
			c8 = 1;
		4'b1001:
			c9 = 1;
		4'b1010:
			c10 = 1;
		4'b1011:
			c11 = 1;
		4'b1100:
			c12 = 1;
		4'b1101:
			c13 = 1;
		4'b1110:
			c14 = 1;
		4'b1111:
			c15 = 1;
		endcase
	end	
end
	
endmodule : counter_decoder