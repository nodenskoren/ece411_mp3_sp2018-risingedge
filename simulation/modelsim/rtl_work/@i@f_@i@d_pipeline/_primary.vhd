library verilog;
use verilog.vl_types.all;
entity IF_ID_pipeline is
    port(
        clk             : in     vl_logic;
        instruction_in  : in     vl_logic_vector(15 downto 0);
        instruction_out : out    vl_logic_vector(15 downto 0)
    );
end IF_ID_pipeline;
