library verilog;
use verilog.vl_types.all;
entity MEM_WB_pipeline is
    port(
        clk             : in     vl_logic;
        dest_in         : in     vl_logic_vector(2 downto 0);
        regfilemux_out_in: in     vl_logic_vector(15 downto 0);
        load_regfile_in : in     vl_logic;
        dest_out        : out    vl_logic_vector(2 downto 0);
        regfilemux_out_out: out    vl_logic_vector(15 downto 0);
        load_regfile_out: out    vl_logic
    );
end MEM_WB_pipeline;
