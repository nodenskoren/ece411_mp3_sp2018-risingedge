library verilog;
use verilog.vl_types.all;
library work;
entity MEM_WB_pipeline is
    port(
        clk             : in     vl_logic;
        dest_in         : in     vl_logic_vector(2 downto 0);
        regfilemux_out_in: in     vl_logic_vector(15 downto 0);
        load_regfile_in : in     vl_logic;
        ctrl_in         : in     work.lc3b_types.lc3b_control_word;
        operation_in    : in     work.lc3b_types.lc3b_opcode;
        dest_out        : out    vl_logic_vector(2 downto 0);
        regfilemux_out_out: out    vl_logic_vector(15 downto 0);
        load_regfile_out: out    vl_logic;
        ctrl_out        : out    work.lc3b_types.lc3b_control_word;
        operation_out   : out    work.lc3b_types.lc3b_opcode;
        stall_pipeline  : in     vl_logic;
        instruction_in  : in     vl_logic_vector(15 downto 0);
        instruction_out : out    vl_logic_vector(15 downto 0);
        pc_in           : in     vl_logic_vector(15 downto 0);
        pc_out          : out    vl_logic_vector(15 downto 0)
    );
end MEM_WB_pipeline;
