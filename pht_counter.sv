module pht_counter
(
	input clk,
	input logic increment_count,
	input logic clear,
	output logic [15:0] count_out
);


logic [15:0] count;
initial
begin
    count = 1'b0;
end

always_ff @(posedge clk)
begin
	if (clear)
		begin
			count<=1'b0;
		end
	else
		begin
		count<=count+increment_count;
		end
end


always_comb
begin
    count_out = count;
end
	
endmodule : pht_counter
