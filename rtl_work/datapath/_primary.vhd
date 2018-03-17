library verilog;
use verilog.vl_types.all;
library work;
entity datapath is
    port(
        clk             : in     vl_logic;
        mem_rdata       : in     vl_logic_vector(127 downto 0);
        mem_resp        : in     vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        mem_wdata       : out    vl_logic_vector(127 downto 0);
        mem_address     : out    vl_logic_vector(11 downto 0);
        mem_sel         : out    vl_logic_vector(15 downto 0);
        ifetch_rdata    : in     vl_logic_vector(127 downto 0);
        ifetch_resp     : in     vl_logic;
        ifetch_read     : out    vl_logic;
        ifetch_address  : out    vl_logic_vector(11 downto 0);
        imm_mode        : out    vl_logic;
        jsr_mode        : out    vl_logic;
        shf_mode        : out    vl_logic_vector(1 downto 0);
        opcode          : out    work.lc3b_types.lc3b_opcode;
        stb_byte        : out    vl_logic;
        ctrl_in         : in     work.lc3b_types.lc3b_control_word;
        offset_sel      : in     vl_logic;
        sr2mux_sel      : in     vl_logic;
        destmux_sel     : in     vl_logic;
        is_ldb_stb      : in     vl_logic
    );
end datapath;
