`timescale 1ns / 1ps
module avg_layer_tb ;
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter dimension = 4 ;
parameter dimension2 = (dimension/2)  ;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
reg [(dimension*dimension*DATA_WIDTH)-1:0] input_value;
reg clk;
wire [(dimension2*dimension2*DATA_WIDTH)-1:0] output_value;
initial
begin
clk =1;

input_value = 512'b01000000000000000000000000000000010000000100000000000000000000000011111110000000000000000000000001000000000000000000000000000000010000001000000000000000000000000100000010100000000000000000000001000000010000000000000000000000010000001000000000000000000000001011111110000000000000000000000011000000000000000000000000000000110000000000000000000000000000001100000001000000000000000000000011000000010000000000000000000000110000001000000000000000000000001100000010000000000000000000000011000000101000000000000000000000 ;
//[2  3  1  2]
//[4  5  3  4]
//[-1 -2 -2 -3] 
//[-3 -4 -4 -5] 


#25 $stop;
end
always begin
     #1  clk = ~clk; 
    end

avg_layer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .dimension(dimension),
.DATA_WIDTH(DATA_WIDTH)) inst1 (
.img_in(input_value),
.clk(clk),
.img_out(output_value)
);
endmodule