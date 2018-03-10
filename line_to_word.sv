import lc3b_types::*;

module line_to_word
(
input lc3b_c_line in,
input lc3b_c_offset offset,
output lc3b_word out
);

always_comb
begin
	case(offset[3:1])
		3'b000: begin
			out = in[15:0];
		end
		3'b001: begin
			out = in[31:16];
		end
		3'b010: begin
			out = in[47:32];
		end
		3'b011: begin
			out = in[63:48];
		end
		3'b100: begin
			out = in[79:64];
		end
		3'b101: begin
			out = in[95:80];
		end
		3'b110: begin
			out = in[111:96];
		end
		3'b111: begin
			out = in[127:112];
		end
	endcase
end
endmodule : line_to_word