library verilog;
use verilog.vl_types.all;
entity counter_control is
    port(
        is_read         : in     vl_logic;
        is_write        : in     vl_logic;
        addr            : in     vl_logic_vector(11 downto 0);
        clear_counter   : out    vl_logic;
        counter_out_sel : out    vl_logic;
        accessing_counter: out    vl_logic
    );
end counter_control;
