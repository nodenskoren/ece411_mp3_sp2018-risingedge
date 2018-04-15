library verilog;
use verilog.vl_types.all;
entity mp3 is
    port(
        dcache_hits     : in     vl_logic_vector(15 downto 0);
        dcache_misses   : in     vl_logic_vector(15 downto 0);
        icache_hits     : in     vl_logic_vector(15 downto 0);
        icache_misses   : in     vl_logic_vector(15 downto 0);
        l2_hits         : in     vl_logic_vector(15 downto 0);
        l2_misses       : in     vl_logic_vector(15 downto 0);
        dcache_hit_clear: out    vl_logic;
        dcache_miss_clear: out    vl_logic;
        icache_hit_clear: out    vl_logic;
        icache_miss_clear: out    vl_logic;
        l2_hit_clear    : out    vl_logic;
        l2_miss_clear   : out    vl_logic
    );
end mp3;
