library verilog;
use verilog.vl_types.all;
library work;
entity forwarding_unit_2 is
    port(
        regwrite_EX     : in     vl_logic;
        regwrite_MEM    : in     vl_logic;
        register_num    : in     vl_logic_vector(2 downto 0);
        destreg_EX      : in     vl_logic_vector(2 downto 0);
        destreg_MEM     : in     vl_logic_vector(2 downto 0);
        operation       : in     work.lc3b_types.lc3b_opcode;
        imm_mode        : in     vl_logic;
        forwarding_unit_out: out    vl_logic_vector(1 downto 0);
        test            : out    vl_logic_vector(3 downto 0)
    );
end forwarding_unit_2;
