module counter_rising_edge
(
	input logic increment_count,
	input logic clear,
	output logic [15:0] count_out
);


logic [15:0] count;
initial
begin
    count = 1'b0;
end

always_ff @(posedge increment_count or posedge clear)
begin
	if (clear)
		begin
			count<=1'b0;
		end
	else if (increment_count)
		begin
		count<=count+1'b1;
		end
end


always_comb
begin
    count_out = count;
end
	
endmodule : counter_rising_edge