module mux_decode_sel #(parameter width = 16)
(
	input logic [3:0] sel,
	//input [width-1:0] a, b, c, d,
	input logic prediction_fail,
	input logic btb_fail,
	input [width-1:0] a, b, c, d, e,

	output logic [width-1:0] f
);

// 010 - jmp, jsrr
// 110 - jsr
// 001 - br
// default - pc + 2
always_comb
begin
	case(sel)
		/*4'b0010:
			f = b;
		4'b1100:
			f = b;
		4'b0100:
			f = c;
		4'b0001:
			f = d;*/
		4'b0010: begin
			if(btb_fail == 1'b0)
				f = a;
			else
				f = b;
		end
		4'b0000: begin
			if(prediction_fail == 1'b1) begin
				f = e;
			end
			else begin
				f = a;
			end	
		end
		4'b1100: begin
			if(btb_fail == 1'b0)
				f = a;
			else
				f = b;
		end
		4'b0100: begin
			if(btb_fail == 1'b0)
				f = a;
			else
				f = c;
		end
		4'b0001: begin
			if(btb_fail == 1'b0)
				f = a;
			else
				f = d;
		end

		default:
			f = a;
	endcase
end
	
endmodule : mux_decode_sel
