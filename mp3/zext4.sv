import lc3b_types::*;

/*
 * zero extension
 */
module zext4 #(parameter width = 4)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out[3:0]= in;
assign out[15:4] = 12'h000;

endmodule : zext4