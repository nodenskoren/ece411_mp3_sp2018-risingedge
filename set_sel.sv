import lc3b_types::*;

module set_sel
(
input lc3b_word mem_wdata_word,
input lc3b_c_offset offset,
input logic [1:0] mem_byte_enable,
output lc3b_c_line out,
output lc3b_word mem_sel
);
always_comb
begin
mem_sel = 16'h0000;
out = 128'h00000000000000000000000000000000;
case(offset[3:1])
    3'b000:begin
        mem_sel[1:0] = mem_byte_enable;
        out[15:0] = mem_wdata_word;
    end
    
    3'b001:begin
        mem_sel[3:2] = mem_byte_enable;
        out[31:16] = mem_wdata_word;
    end
    
    3'b010:begin
        mem_sel[5:4] = mem_byte_enable;
        out[47:32] = mem_wdata_word;
    end
    
    3'b011:begin
        mem_sel[7:6] = mem_byte_enable;
        out[63:48] = mem_wdata_word;
    end
    
    3'b100:begin
        mem_sel[9:8] = mem_byte_enable;
        out[79:64] = mem_wdata_word;
    end
    
    3'b101:begin
        mem_sel[11:10] = mem_byte_enable;
        out[95:80] = mem_wdata_word;
    end
    
    3'b110:begin
        mem_sel[13:12] = mem_byte_enable;
        out[111:96] = mem_wdata_word;
    end
    
    3'b111:begin
        mem_sel[15:14] = mem_byte_enable;
        out[127:112] = mem_wdata_word;
    end
endcase
end
endmodule: set_sel