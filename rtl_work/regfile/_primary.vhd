library verilog;
use verilog.vl_types.all;
entity regfile is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        \in\            : in     vl_logic_vector(15 downto 0);
        src_a           : in     vl_logic_vector(2 downto 0);
        src_b           : in     vl_logic_vector(2 downto 0);
        dest            : in     vl_logic_vector(2 downto 0);
        reg_a           : out    vl_logic_vector(15 downto 0);
        reg_b           : out    vl_logic_vector(15 downto 0);
        sr              : in     vl_logic_vector(2 downto 0);
        sr_out          : out    vl_logic_vector(15 downto 0);
        src_a_ID_EX     : in     vl_logic_vector(2 downto 0);
        src_b_ID_EX     : in     vl_logic_vector(2 downto 0);
        reg_a_ID_EX     : out    vl_logic_vector(15 downto 0);
        reg_b_ID_EX     : out    vl_logic_vector(15 downto 0)
    );
end regfile;
