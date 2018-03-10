import lc3b_types::*;

/*
 * zero extension
 */
module zextadj #(parameter width = 8)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out[0] = 0;
assign out[8:1]= in;
assign out[15:9] = 7'b0000000;
endmodule : zextadj