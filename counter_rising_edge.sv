module counter_rising_edge
(
	input clk,
	input logic increment_count,
	input logic clear,
	output logic [15:0] count_out
);


logic [15:0] count;
logic hold;
initial
begin
    count = 1'b0;
	 hold = 1'b0;
end

always_ff @(posedge clk)
begin
	if (clear)
		begin
			count<=1'b0;
		end
	else if (increment_count && !hold)
		begin
		count<=count+1'b1;
		hold<=1;
		end
	else if (!increment_count)
		begin
		hold<=0;
		end
end


always_comb
begin
    count_out = count;
end
	
endmodule : counter_rising_edge