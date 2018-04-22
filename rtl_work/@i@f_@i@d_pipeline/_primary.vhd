library verilog;
use verilog.vl_types.all;
entity IF_ID_pipeline is
    port(
        clk             : in     vl_logic;
        instruction_in  : in     vl_logic_vector(15 downto 0);
        instruction_out : out    vl_logic_vector(15 downto 0);
        stall_pipeline  : in     vl_logic;
        branch_history_in: in     vl_logic_vector(7 downto 0);
        branch_history_out: out    vl_logic_vector(7 downto 0);
        branch_prediction_in: in     vl_logic;
        branch_prediction_out: out    vl_logic;
        branch_address_in: in     vl_logic_vector(15 downto 0);
        branch_address_out: out    vl_logic_vector(15 downto 0);
        pc_in           : in     vl_logic_vector(15 downto 0);
        pc_out          : out    vl_logic_vector(15 downto 0)
    );
end IF_ID_pipeline;
