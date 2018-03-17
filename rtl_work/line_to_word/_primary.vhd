library verilog;
use verilog.vl_types.all;
entity line_to_word is
    port(
        \in\            : in     vl_logic_vector(127 downto 0);
        offset          : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end line_to_word;
