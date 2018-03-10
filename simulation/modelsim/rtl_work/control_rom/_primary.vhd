library verilog;
use verilog.vl_types.all;
library work;
entity control_rom is
    port(
        opcode          : in     work.lc3b_types.lc3b_opcode;
        imm_mode        : in     vl_logic;
        ctrl            : out    work.lc3b_types.lc3b_control_word;
        offset_sel      : out    vl_logic;
        sr2mux_sel      : out    vl_logic
    );
end control_rom;
