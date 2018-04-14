library verilog;
use verilog.vl_types.all;
entity l2cache is
    port(
        l2_hit_clear    : in     vl_logic;
        l2_miss_clear   : in     vl_logic;
        cache_hit_cnt   : out    vl_logic_vector(15 downto 0);
        cache_miss_cnt  : out    vl_logic_vector(15 downto 0)
    );
end l2cache;
