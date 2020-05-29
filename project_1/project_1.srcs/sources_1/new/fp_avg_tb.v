`timescale 1ns / 1ps
module fp_avg_tb ;
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
reg [127:0] input_value;
reg clk;
reg reset ;
wire [31:0] output_value;

initial
begin
clk =0;
reset=0 ;
input_value = 128'b01000000100000000000000000000000010000001010000000000000000000000100000011000000000000000000000001000000111000000000000000000000 ; 
//4,5,6,7 avg=5.5 

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b01000001001000000000000000000000010000010100000000000000000000000100000101110000000000000000000001000001100000000000000000000000 ; 
//10,12,15,16 avg =13.25

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b00111110010011001100110011001101001111110000000000000000000000000011111100110011001100110011001100111101110011001100110011001101 ; 
//0.2,0.5,0.7,0.1 avg=0.375

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b01000010110010000000000000000000010001001001110001000000000000000100000100100000000000000000000000111111100000000000000000000000 ; 
//100,1250,10,1  avg=340.25 

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b01000001010100000000000000000000110000001010000000000000000000001100000100000000000000000000000001000000000000000000000000000000 ; 
//13,-5,-8,2 avg=0.5

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b00111111100000000000000000000000001111111000000000000000000000000011111110000000000000000000000000111111100000000000000000000000 ; 
//1,1,1,1 avg =1

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 ; 
//0,0,0,0 avg =0

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b10111111100000000000000000000000000000000000000000000000000000000011111110000000000000000000000001000000000000000000000000000000 ;
//-1,0,1,2 avg=0.5


#25 $stop;
end

always begin
     #1  clk = ~clk; 
    end
fp_avg #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) inst1 (
.fp_input(input_value),
.clk(clk),
.fp_output(output_value),
.reset(reset)
);
endmodule

