module counter
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
   if (increment_count && !clear)
    begin
        count = count + 1;
    end
end

always_ff @ (posedge clear)
begin
	count<=0;
end

always_comb
begin
    count_out = count;
end
	
endmodule : counter