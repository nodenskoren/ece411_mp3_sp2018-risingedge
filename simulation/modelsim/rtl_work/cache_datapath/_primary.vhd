library verilog;
use verilog.vl_types.all;
entity cache_datapath is
    port(
        clk             : in     vl_logic;
        mem_address     : in     vl_logic_vector(11 downto 0);
        wb_sel          : in     vl_logic;
        data0_writeline : in     vl_logic;
        data1_writeline : in     vl_logic;
        pmem_rdata      : in     vl_logic_vector(127 downto 0);
        tag0_write      : in     vl_logic;
        tag1_write      : in     vl_logic;
        valid0_write    : in     vl_logic;
        valid1_write    : in     vl_logic;
        valid_in        : in     vl_logic;
        valid0_out      : out    vl_logic;
        valid1_out      : out    vl_logic;
        dirty0_write    : in     vl_logic;
        dirty1_write    : in     vl_logic;
        dirty_in        : in     vl_logic;
        dirty0_out      : out    vl_logic;
        dirty1_out      : out    vl_logic;
        updateLRU       : in     vl_logic;
        LRU_out         : out    vl_logic;
        hit0            : out    vl_logic;
        hit1            : out    vl_logic;
        pmem_wdata      : out    vl_logic_vector(127 downto 0);
        cpu_wdata       : in     vl_logic_vector(127 downto 0);
        cpu_rdata       : out    vl_logic_vector(127 downto 0);
        offset_sel      : in     vl_logic_vector(15 downto 0);
        adrmux_sel      : in     vl_logic_vector(1 downto 0);
        pmem_adr        : out    vl_logic_vector(11 downto 0)
    );
end cache_datapath;
