import lc3b_types::*;

module shl
(
    input lc3b_word in,
    output lc3b_word out
);

always_comb
begin
    out = in << 1;
end

endmodule : shl