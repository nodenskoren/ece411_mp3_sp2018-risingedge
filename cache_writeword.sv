import lc3b_types::*;


module cache_writeword #(parameter width = 128)
(
    input [width-1:0] curline, newline,
	 input lc3b_word sel,
    output logic [width-1:0] out
);


always_comb
begin
	for (int i = 0; i < 16; i++) begin
		out[i*8 +:8] = sel[i] ? newline[i*8 +:8] : curline[i*8 +:8];
	end
end

endmodule : cache_writeword