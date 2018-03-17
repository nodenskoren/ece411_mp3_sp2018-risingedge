library verilog;
use verilog.vl_types.all;
entity cache_writeword is
    generic(
        width           : integer := 128
    );
    port(
        curline         : in     vl_logic_vector;
        newline         : in     vl_logic_vector;
        sel             : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end cache_writeword;
