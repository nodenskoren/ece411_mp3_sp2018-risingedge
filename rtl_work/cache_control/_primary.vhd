library verilog;
use verilog.vl_types.all;
entity cache_control is
    port(
        clk             : in     vl_logic;
        readwrite       : in     vl_logic;
        dirty0_out      : in     vl_logic;
        dirty1_out      : in     vl_logic;
        valid0_out      : in     vl_logic;
        valid1_out      : in     vl_logic;
        hit0            : in     vl_logic;
        hit1            : in     vl_logic;
        LRU_out         : in     vl_logic;
        pmem_resp       : in     vl_logic;
        req             : in     vl_logic;
        data0_writeword : out    vl_logic;
        data1_writeword : out    vl_logic;
        data0_writeline : out    vl_logic;
        data1_writeline : out    vl_logic;
        tag0_write      : out    vl_logic;
        tag1_write      : out    vl_logic;
        valid0_write    : out    vl_logic;
        valid1_write    : out    vl_logic;
        valid_in        : out    vl_logic;
        dirty0_write    : out    vl_logic;
        dirty1_write    : out    vl_logic;
        dirty_in        : out    vl_logic;
        updateLRU       : out    vl_logic;
        pmem_write      : out    vl_logic;
        pmem_read       : out    vl_logic;
        cpu_resp        : out    vl_logic;
        wb_sel          : out    vl_logic;
        adrmux_sel      : out    vl_logic_vector(1 downto 0);
        cache_hit_inc   : out    vl_logic;
        cache_miss_inc  : out    vl_logic;
        load_adr        : out    vl_logic
    );
end cache_control;
