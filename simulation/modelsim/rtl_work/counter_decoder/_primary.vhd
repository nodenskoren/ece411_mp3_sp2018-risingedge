library verilog;
use verilog.vl_types.all;
entity counter_decoder is
    port(
        clear_counter   : in     vl_logic;
        offset          : in     vl_logic_vector(3 downto 0);
        c0              : out    vl_logic;
        c1              : out    vl_logic;
        c2              : out    vl_logic;
        c3              : out    vl_logic;
        c4              : out    vl_logic;
        c5              : out    vl_logic;
        c6              : out    vl_logic;
        c7              : out    vl_logic;
        c8              : out    vl_logic;
        c9              : out    vl_logic;
        c10             : out    vl_logic;
        c11             : out    vl_logic;
        c12             : out    vl_logic;
        c13             : out    vl_logic;
        c14             : out    vl_logic;
        c15             : out    vl_logic
    );
end counter_decoder;
