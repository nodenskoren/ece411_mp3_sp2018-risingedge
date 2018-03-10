import lc3b_types::*;

module branch_unit
(
    input lc3b_nzp input_condition,
    input lc3b_nzp branch_condition,
    output logic branch
);

always_comb
begin
    if (input_condition & branch_condition)
        branch = 1;
    else
        branch = 0;
end

endmodule : branch_unit