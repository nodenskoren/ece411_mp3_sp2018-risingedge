library verilog;
use verilog.vl_types.all;
entity stall_unit is
    port(
        clk             : in     vl_logic;
        mem_read_in     : in     vl_logic;
        mem_write_in    : in     vl_logic;
        mem_resp        : in     vl_logic;
        ifetch_resp     : in     vl_logic;
        mem_address_in  : in     vl_logic_vector(11 downto 0);
        is_ldi          : in     vl_logic;
        is_sti          : in     vl_logic;
        line_offset_in  : in     vl_logic_vector(3 downto 0);
        stall_pipeline  : out    vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        mem_address     : out    vl_logic_vector(11 downto 0);
        mem_rdata       : in     vl_logic_vector(15 downto 0);
        line_offset_out : out    vl_logic_vector(3 downto 0);
        flushed         : in     vl_logic
    );
end stall_unit;
