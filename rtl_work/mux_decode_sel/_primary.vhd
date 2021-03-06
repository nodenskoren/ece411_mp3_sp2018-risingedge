library verilog;
use verilog.vl_types.all;
entity mux_decode_sel is
    generic(
        width           : integer := 16
    );
    port(
        sel             : in     vl_logic_vector(3 downto 0);
        prediction_fail : in     vl_logic;
        btb_fail        : in     vl_logic;
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        c               : in     vl_logic_vector;
        d               : in     vl_logic_vector;
        e               : in     vl_logic_vector;
        f               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end mux_decode_sel;
