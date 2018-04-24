library verilog;
use verilog.vl_types.all;
entity evict_buffer is
    port(
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic
    );
end evict_buffer;
