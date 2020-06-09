`timescale 1ns / 1ps
module array_adder_tb();

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
parameter ARRAY_LEN =2;
reg [ARRAY_LEN*DATA_WIDTH-1:0]      in1;
reg [ARRAY_LEN*DATA_WIDTH-1:0]      in2; 
reg clk ;
wire [ARRAY_LEN*DATA_WIDTH-1:0] out1 ;
    initial //display variables
    $monitor ("%b + %b = %b",in1, in2, out1);
    
    initial //apply input vectors
    begin
        clk = 1;
        //+0.75&&0.75 + 1 && 2= + 1.75&&2.75
        #2 in1 = 32'b0011101000000000_0011101000000000;
           in2 = 32'b0011110000000000_0100000000000000;
        //+0.75&&-0.75 + -1 && 2= + 1.75&&1.25
        #2 in1 = 32'b0011101000000000_1011101000000000;
           in2 = 32'b1011110000000000_0100000000000000;
        #2 $stop;
    end
    
    always begin
         #1  clk = ~clk; 
        end
    
    array_adder #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.ARRAY_LEN(ARRAY_LEN))
    array_adder1( .in1(in1),.in2(in2),.clk(clk),.out1(out1));
endmodule
