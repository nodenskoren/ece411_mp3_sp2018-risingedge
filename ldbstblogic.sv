module ldbstblogic
(
	input logic is_ldb_stb_in,
	input logic [2:0] regfilesel_in,
	input logic [1:0] mem_byte_enable_in,
	input logic store_byte,
	output logic [2:0] regfilesel_out,
	output logic [1:0] mem_byte_enable_out
);


always_comb
begin
	regfilesel_out = regfilesel_in;
	mem_byte_enable_out = mem_byte_enable_in;
	if(is_ldb_stb_in == 1'b1) begin
		if(store_byte == 1'b0) begin
			regfilesel_out = 3'b100;
			mem_byte_enable_out = 2'b01;
		end
		else begin
			regfilesel_out = 3'b101;
			mem_byte_enable_out = 2'b10;
		end
	end
end
	
endmodule : ldbstblogic