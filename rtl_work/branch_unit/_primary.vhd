library verilog;
use verilog.vl_types.all;
entity branch_unit is
    port(
        input_condition : in     vl_logic_vector(2 downto 0);
        branch_condition: in     vl_logic_vector(2 downto 0);
        branch          : out    vl_logic
    );
end branch_unit;
