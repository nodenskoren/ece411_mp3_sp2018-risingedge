library verilog;
use verilog.vl_types.all;
entity forwarding_unit is
    port(
        regwrite_EX     : in     vl_logic;
        regwrite_MEM    : in     vl_logic;
        register_num    : in     vl_logic_vector(2 downto 0);
        destreg_EX      : in     vl_logic_vector(2 downto 0);
        destreg_MEM     : in     vl_logic_vector(2 downto 0);
        forwarding_unit_out: out    vl_logic_vector(1 downto 0)
    );
end forwarding_unit;
