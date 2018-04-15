library verilog;
use verilog.vl_types.all;
entity counter_rising_edge is
    port(
        clk             : in     vl_logic;
        increment_count : in     vl_logic;
        clear           : in     vl_logic;
        count_out       : out    vl_logic_vector(15 downto 0)
    );
end counter_rising_edge;
