library verilog;
use verilog.vl_types.all;
entity EX_MEM_pipeline is
    port(
        clk             : in     vl_logic;
        alu_out_in      : in     vl_logic_vector(15 downto 0);
        addr_adder_out_in: in     vl_logic_vector(15 downto 0);
        pc_in           : in     vl_logic_vector(15 downto 0);
        dest_in         : in     vl_logic_vector(2 downto 0);
        nzp_in          : in     vl_logic_vector(2 downto 0);
        is_br_in        : in     vl_logic;
        load_cc_in      : in     vl_logic;
        load_regfile_in : in     vl_logic;
        mem_read_in     : in     vl_logic;
        mem_write_in    : in     vl_logic;
        regfilemux_sel_in: in     vl_logic_vector(1 downto 0);
        dest_data_in    : in     vl_logic_vector(15 downto 0);
        alu_out_out     : out    vl_logic_vector(15 downto 0);
        addr_adder_out_out: out    vl_logic_vector(15 downto 0);
        pc_out          : out    vl_logic_vector(15 downto 0);
        dest_out        : out    vl_logic_vector(2 downto 0);
        nzp_out         : out    vl_logic_vector(2 downto 0);
        is_br_out       : out    vl_logic;
        load_cc_out     : out    vl_logic;
        load_regfile_out: out    vl_logic;
        mem_read_out    : out    vl_logic;
        mem_write_out   : out    vl_logic;
        regfilemux_sel_out: out    vl_logic_vector(1 downto 0);
        dest_data_out   : out    vl_logic_vector(15 downto 0)
    );
end EX_MEM_pipeline;
