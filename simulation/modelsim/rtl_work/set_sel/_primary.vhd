library verilog;
use verilog.vl_types.all;
entity set_sel is
    port(
        mem_wdata_word  : in     vl_logic_vector(15 downto 0);
        offset          : in     vl_logic_vector(3 downto 0);
        mem_byte_enable : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(127 downto 0);
        mem_sel         : out    vl_logic_vector(15 downto 0)
    );
end set_sel;
