library verilog;
use verilog.vl_types.all;
library work;
entity always_branch is
    port(
        clk             : in     vl_logic;
        pc              : in     vl_logic_vector(7 downto 0);
        instruction     : in     work.lc3b_types.lc3b_opcode;
        full_instruction: in     vl_logic_vector(15 downto 0);
        instruction_EX_MEM: in     work.lc3b_types.lc3b_opcode;
        stall           : in     vl_logic;
        branch_prediction: out    vl_logic;
        branch_prediction_address: out    vl_logic_vector(15 downto 0);
        branch_history_out: out    vl_logic_vector(7 downto 0);
        prediction_made : out    vl_logic;
        btb_access      : out    vl_logic;
        pc_EX_MEM       : in     vl_logic_vector(7 downto 0);
        branch_history_EX_MEM: in     vl_logic_vector(7 downto 0);
        br_address      : in     vl_logic_vector(15 downto 0);
        jsr_address     : in     vl_logic_vector(15 downto 0);
        jmp_address     : in     vl_logic_vector(15 downto 0);
        trap_address    : in     vl_logic_vector(15 downto 0);
        branch_enable   : in     vl_logic;
        jmp_enable      : in     vl_logic;
        trap_enable     : in     vl_logic;
        jsr_enable      : in     vl_logic;
        branched        : in     vl_logic;
        flushed         : in     vl_logic
    );
end always_branch;
