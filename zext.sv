import lc3b_types::*;

/*
 * zero extension
 */
module zext #(parameter width = 8)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out[7:0]= in;
assign out[15:8] = 8'h00;

endmodule : zext