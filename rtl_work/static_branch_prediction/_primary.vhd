library verilog;
use verilog.vl_types.all;
library work;
entity static_branch_prediction is
    port(
        load_cc_in      : in     vl_logic;
        load_cc_out     : out    vl_logic;
        clk             : in     vl_logic;
        branch_enable   : in     vl_logic;
        load_regfile    : in     vl_logic;
        unconditional_branch: in     vl_logic;
        stall           : in     vl_logic;
        mem_write_in    : in     vl_logic;
        load_regfile_out: out    vl_logic;
        mem_write_out   : out    vl_logic;
        branch_enable_out: out    vl_logic;
        mem_read_in     : in     vl_logic;
        is_load         : in     work.lc3b_types.lc3b_opcode;
        is_j_in         : in     vl_logic;
        is_j_out        : out    vl_logic;
        is_jsr_in       : in     vl_logic;
        is_jsr_out      : out    vl_logic;
        is_trap_in      : in     vl_logic;
        is_trap_out     : out    vl_logic;
        flushed         : out    vl_logic;
        mem_read_out    : out    vl_logic;
        forwarding_mask : out    vl_logic_vector(1 downto 0);
        br_address      : in     vl_logic_vector(15 downto 0);
        jsr_address     : in     vl_logic_vector(15 downto 0);
        jmp_address     : in     vl_logic_vector(15 downto 0);
        trap_address    : in     vl_logic_vector(15 downto 0);
        branch_prediction_address: in     vl_logic_vector(15 downto 0);
        branch_prediction: in     vl_logic;
        instruction     : in     vl_logic_vector(15 downto 0);
        prediction_fail : out    vl_logic;
        btb_fail        : out    vl_logic
    );
end static_branch_prediction;
