library verilog;
use verilog.vl_types.all;
entity stall_unit is
    port(
        clk             : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        mem_resp        : in     vl_logic;
        ifetch_resp     : in     vl_logic;
        is_ldi          : in     vl_logic;
        is_sti          : in     vl_logic;
        stall_pipeline  : out    vl_logic;
        sti_write       : out    vl_logic;
        is_second_access: out    vl_logic
    );
end stall_unit;
