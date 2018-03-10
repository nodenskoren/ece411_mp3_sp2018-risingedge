library verilog;
use verilog.vl_types.all;
library work;
entity datapath is
    port(
        clk             : in     vl_logic;
        pcmux_sel       : in     vl_logic_vector(2 downto 0);
        load_pc         : in     vl_logic;
        load_ir         : in     vl_logic;
        load_mar        : in     vl_logic;
        load_mdr        : in     vl_logic;
        marmux_sel      : in     vl_logic_vector(1 downto 0);
        mdrmux_sel      : in     vl_logic_vector(1 downto 0);
        storemux_sel    : in     vl_logic;
        regfilemux_sel  : in     vl_logic_vector(2 downto 0);
        load_cc         : in     vl_logic;
        load_regfile    : in     vl_logic;
        alumux_sel      : in     vl_logic_vector(1 downto 0);
        aluop           : in     work.lc3b_types.lc3b_aluop;
        mem_rdata       : in     vl_logic_vector(15 downto 0);
        register_r7     : in     vl_logic_vector(2 downto 0);
        destmux_sel     : in     vl_logic;
        opcode          : out    work.lc3b_types.lc3b_opcode;
        mem_address     : out    vl_logic_vector(15 downto 0);
        mem_wdata       : out    vl_logic_vector(15 downto 0);
        branch_enable   : out    vl_logic;
        jsr_operation   : out    vl_logic;
        shf_operation   : out    vl_logic_vector(1 downto 0);
        stb_mode        : out    vl_logic
    );
end datapath;
