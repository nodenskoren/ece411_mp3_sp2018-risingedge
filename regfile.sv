import lc3b_types::*;

module regfile
(
    input clk,
    input load,
    input lc3b_word in,
    input lc3b_reg src_a, src_b, dest,
    output lc3b_word reg_a, reg_b,
	 
	 input lc3b_reg sr,
	 output lc3b_word sr_out,
	 input lc3b_reg src_a_ID_EX,
	 input lc3b_reg src_b_ID_EX,
	 output lc3b_word reg_a_ID_EX,
	 output lc3b_word reg_b_ID_EX	 
);

lc3b_word data [7:0] /* synthesis ramstyle = "logic" */;

/* Altera device registers are 0 at power on. Specify this
 * so that Modelsim works as expected.
 */
initial
begin
    for (int i = 0; i < $size(data); i++)
    begin
        data[i] = 16'b0;
    end
end

always_ff @(negedge clk)
begin
    if (load == 1)
    begin
        data[dest] = in;
    end
end

always_comb
begin
    reg_a = data[src_a];
    reg_b = data[src_b];
	 sr_out = data[sr];
	 reg_a_ID_EX = data[src_a_ID_EX];
	 reg_b_ID_EX = data[src_b_ID_EX];	 
end

endmodule : regfile
