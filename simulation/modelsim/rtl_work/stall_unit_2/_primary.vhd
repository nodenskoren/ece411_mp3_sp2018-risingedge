library verilog;
use verilog.vl_types.all;
library work;
entity stall_unit_2 is
    port(
        clk             : in     vl_logic;
        operation       : in     work.lc3b_types.lc3b_opcode;
        stall_pipeline_load: out    vl_logic
    );
end stall_unit_2;
