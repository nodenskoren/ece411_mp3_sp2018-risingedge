import lc3b_types::*;

module pseudoLRU4way #(parameter width = 3)
(
	input clk,
	input update,
	input lc3b_c_index index,
	output logic [1:0] out
	//output logic [1:0] evictmuxsel
);

logic [width-1:0] data[7:0];
logic [1:0] muxsel[7:0];
logic [width-1:0] cur;
//logic [1:0] cursel;

assign cur = data[index];

initial
begin
	for(int i = 0; i < $size(data); i++)
	begin
		data[i] = 3'b000;
		muxsel [i] = 2'b00;
	end
end

always_ff @(posedge clk)
begin
	if(update == 1)
	begin
		if(cur[2] == 0) begin
			if(cur[1] == 0) begin
				data[index] = {2'b11, cur[0]};
				muxsel[index] = 2'b00;
			end
			else begin
				data[index] = {2'b10, cur[0]};
				muxsel[index] = 2'b01;
			end
		end
		else if(cur[0] == 0) begin
			data[index] = {1'b0,cur[1],1'b1};
			muxsel[index] = 2'b10;
		end
		else begin
			data[index] = {1'b0, cur[1], 1'b0};
			muxsel[index] = 2'b11;
		end
	end
end
		


//assign out = data[index];
assign out = muxsel[index];
	
endmodule : pseudoLRU4way