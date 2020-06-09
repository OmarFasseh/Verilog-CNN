`timescale 1ns / 1ps
module array_adder( in1,in2,clk,,out1);
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
parameter ARRAY_LEN =25;
input [ARRAY_LEN*DATA_WIDTH-1:0]      in1;
input [ARRAY_LEN*DATA_WIDTH-1:0]      in2; 
input clk ;
output [ARRAY_LEN*DATA_WIDTH-1:0] out1 ;


genvar i;
generate
    for(i = 0; i < ARRAY_LEN; i = i + 1) begin
        fp_add_2 #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) 
        fpadd(
        .A_FP(in1[(i+1)*DATA_WIDTH-1-:DATA_WIDTH]),
        .B_FP(in2[(i+1)*DATA_WIDTH-1-:DATA_WIDTH]),
        .sign(out1[i*DATA_WIDTH+EXPONENT_WIDTH+MANTISSA_WIDTH]),
        .exponent(out1[i*DATA_WIDTH+EXPONENT_WIDTH+MANTISSA_WIDTH-1-:EXPONENT_WIDTH]),
        .mantissa(out1[i*DATA_WIDTH+MANTISSA_WIDTH-1-:MANTISSA_WIDTH]),
        .clk(clk)
        );
    end
endgenerate
endmodule
