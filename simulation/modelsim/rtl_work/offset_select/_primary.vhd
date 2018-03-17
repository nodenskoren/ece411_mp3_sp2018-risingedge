library verilog;
use verilog.vl_types.all;
entity offset_select is
    port(
        is_second_access: in     vl_logic;
        addr_sel_bit0   : in     vl_logic;
        alu_out         : in     vl_logic_vector(3 downto 0);
        trap_out        : in     vl_logic_vector(3 downto 0);
        ldi_sti_out     : in     vl_logic_vector(3 downto 0);
        mem_offset      : out    vl_logic_vector(3 downto 0)
    );
end offset_select;
