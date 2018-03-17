module plus2 #(parameter width = 16)
(
    input logic stall_pipeline,
    input [width-1:0] in,
    output logic [width-1:0] out
);

always_comb
begin
	if(stall_pipeline == 1)
		out = in;
	else
		out = in + 4'h2;
end
endmodule : plus2
