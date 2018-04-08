library verilog;
use verilog.vl_types.all;
entity static_branch_prediction is
    port(
        clk             : in     vl_logic;
        branch_enable   : in     vl_logic;
        load_regfile    : in     vl_logic;
        unconditional_branch: in     vl_logic;
        stall           : in     vl_logic;
        mem_write_in    : in     vl_logic;
        load_regfile_out: out    vl_logic;
        mem_write_out   : out    vl_logic;
        branch_enable_out: out    vl_logic;
        mem_read_in     : in     vl_logic
    );
end static_branch_prediction;
