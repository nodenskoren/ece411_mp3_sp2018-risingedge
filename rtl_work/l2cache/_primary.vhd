library verilog;
use verilog.vl_types.all;
entity l2cache is
    port(
        pmem_read       : out    vl_logic;
        pmem_write      : out    vl_logic
    );
end l2cache;
