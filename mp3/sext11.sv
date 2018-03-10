import lc3b_types::*;

/*
 * sign extension
 */
module sext11 #(parameter width = 11)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out = $signed(in);

endmodule : sext11