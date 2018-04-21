library verilog;
use verilog.vl_types.all;
entity pseudoLRU4way is
    generic(
        width           : integer := 3
    );
    port(
        clk             : in     vl_logic;
        update          : in     vl_logic;
        index           : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end pseudoLRU4way;
