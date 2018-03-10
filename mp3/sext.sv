import lc3b_types::*;

/*
 * sign extension
 */
module sext5 #(parameter width = 5)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out = $signed(in);

endmodule : sext5
