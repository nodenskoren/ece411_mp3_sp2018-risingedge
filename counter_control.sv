import lc3b_types::*;

module counter_control
(
	input logic is_read,
	input logic is_write,
	input lc3b_wb_adr addr,
	output logic clear_counter,
	output logic counter_out_sel,
	output logic accessing_counter
);


always_comb
begin
	counter_out_sel = 1'b0;
	clear_counter = 1'b0;
	accessing_counter = 1'b0;
	if(addr == 12'hfff && (is_read || is_write))
	begin
		accessing_counter = 1'b1;
		if(is_read)
		begin
			counter_out_sel = 1'b1;
		end
		else
		begin
			clear_counter = 1'b1;
		end
		
	end
end
	
endmodule : counter_control