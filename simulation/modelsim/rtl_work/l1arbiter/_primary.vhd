library verilog;
use verilog.vl_types.all;
entity l1arbiter is
    port(
        clk             : in     vl_logic;
        i_rw            : in     vl_logic;
        d_rw            : in     vl_logic;
        mem_resp        : in     vl_logic;
        cache_sel       : out    vl_logic
    );
end l1arbiter;
