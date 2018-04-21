library verilog;
use verilog.vl_types.all;
entity l2cache4way is
    port(
        l2_hit_clear    : in     vl_logic;
        l2_miss_clear   : in     vl_logic;
        cache_hit_cnt   : out    vl_logic_vector(15 downto 0);
        cache_miss_cnt  : out    vl_logic_vector(15 downto 0);
        pmem_read       : out    vl_logic;
        pmem_write      : out    vl_logic
    );
end l2cache4way;
