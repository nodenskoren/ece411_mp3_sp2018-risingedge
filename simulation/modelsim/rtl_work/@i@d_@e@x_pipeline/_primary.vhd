library verilog;
use verilog.vl_types.all;
library work;
entity ID_EX_pipeline is
    port(
        clk             : in     vl_logic;
        ctrl_in         : in     work.lc3b_types.lc3b_control_word;
        sr1_in          : in     vl_logic_vector(15 downto 0);
        sr2_in          : in     vl_logic_vector(15 downto 0);
        offset6_in      : in     vl_logic_vector(15 downto 0);
        branch_offset_in: in     vl_logic_vector(15 downto 0);
        nzp_in          : in     vl_logic_vector(2 downto 0);
        dest_in         : in     vl_logic_vector(2 downto 0);
        pc_in           : in     vl_logic_vector(15 downto 0);
        dest_data_in    : in     vl_logic_vector(15 downto 0);
        trapvector_in   : in     vl_logic_vector(15 downto 0);
        ctrl_out        : out    work.lc3b_types.lc3b_control_word;
        sr1_out         : out    vl_logic_vector(15 downto 0);
        sr2_out         : out    vl_logic_vector(15 downto 0);
        offset6_out     : out    vl_logic_vector(15 downto 0);
        branch_offset_out: out    vl_logic_vector(15 downto 0);
        nzp_out         : out    vl_logic_vector(2 downto 0);
        dest_out        : out    vl_logic_vector(2 downto 0);
        pc_out          : out    vl_logic_vector(15 downto 0);
        dest_data_out   : out    vl_logic_vector(15 downto 0);
        trapvector_out  : out    vl_logic_vector(15 downto 0);
        stall_pipeline  : in     vl_logic
    );
end ID_EX_pipeline;
