library verilog;
use verilog.vl_types.all;
entity cache_prefetch is
    port(
        mem_dats        : in     vl_logic_vector(127 downto 0);
        mem_ack         : in     vl_logic;
        mem_rty         : in     vl_logic;
        mem_datm        : out    vl_logic_vector(127 downto 0);
        mem_cyc         : out    vl_logic;
        mem_stb         : out    vl_logic;
        mem_we          : out    vl_logic;
        mem_sel         : out    vl_logic_vector(15 downto 0);
        mem_adr         : out    vl_logic_vector(11 downto 0);
        cache_hit_cnt   : out    vl_logic_vector(15 downto 0);
        cache_miss_cnt  : out    vl_logic_vector(15 downto 0);
        hit_clear       : in     vl_logic;
        miss_clear      : in     vl_logic
    );
end cache_prefetch;
