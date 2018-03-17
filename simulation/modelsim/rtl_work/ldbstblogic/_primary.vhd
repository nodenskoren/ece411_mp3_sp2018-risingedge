library verilog;
use verilog.vl_types.all;
entity ldbstblogic is
    port(
        is_ldb_stb_in   : in     vl_logic;
        regfilesel_in   : in     vl_logic_vector(2 downto 0);
        mem_byte_enable_in: in     vl_logic_vector(1 downto 0);
        store_byte      : in     vl_logic;
        regfilesel_out  : out    vl_logic_vector(2 downto 0);
        mem_byte_enable_out: out    vl_logic_vector(1 downto 0)
    );
end ldbstblogic;
