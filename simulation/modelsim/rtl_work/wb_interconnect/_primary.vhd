library verilog;
use verilog.vl_types.all;
entity wb_interconnect is
    port(
        dcache_hit_clear: in     vl_logic;
        dcache_miss_clear: in     vl_logic;
        icache_hit_clear: in     vl_logic;
        icache_miss_clear: in     vl_logic;
        dcache_hits     : out    vl_logic_vector(15 downto 0);
        dcache_misses   : out    vl_logic_vector(15 downto 0);
        icache_hits     : out    vl_logic_vector(15 downto 0);
        icache_misses   : out    vl_logic_vector(15 downto 0)
    );
end wb_interconnect;
