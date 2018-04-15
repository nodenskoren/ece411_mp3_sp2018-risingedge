library verilog;
use verilog.vl_types.all;
entity stall_unit_2 is
    port(
        clk             : in     vl_logic;
        instruction_curr: in     vl_logic_vector(15 downto 0);
        instruction_last: in     vl_logic_vector(15 downto 0);
        flushed         : in     vl_logic;
        stall_pipeline_load: out    vl_logic
    );
end stall_unit_2;
