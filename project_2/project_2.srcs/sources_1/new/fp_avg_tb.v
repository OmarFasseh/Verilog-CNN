`timescale 1ns / 1ps
module fp_avg_tb ;
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
reg [63:0] input_value;
reg clk;
reg reset ;
wire [15:0] output_value;
initial //display variables
    $monitor ("input=%h, Output=%h",
    input_value, output_value);
initial
begin
clk =0;
reset=0 ;
input_value = 64'b0100010000000000010001010000000001000110000000000100011100000000; 
//4,5,6,7 avg=5.5 

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 64'b0100100100000000010010100000000001001011100000000100110000000000; 
//10,12,15,16 avg =13.25

#8 reset = 1 ;
#2 reset = 0 ;

input_value = 64'b0011001001100110001110000000000000111001100110100010111001100110; 
//0.2,0.5,0.7,0.1 avg=0.375

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 64'b0101011001000000011001001110001001001001000000000011110000000000; 
//100,1250,10,1  avg=340.25 

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b0100101010000000110001010000000011001000000000000100000000000000 ; 
//13,-5,-8,2 avg=0.5

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b0011110000000000001111000000000000111100000000000011110000000000 ; 
//1,1,1,1 avg =1

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 128'b0000000000000000000000000000000000000000000000000000000000000000 ; 
//0,0,0,0 avg =0


#8 reset = 1 ;
#2 reset = 0 ;
input_value = 64'b0100100100000000001111000000000011001000000000001100000000000000;
//10,1,-8,-2 avg=0.25

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 64'b1010111001100110101100100110011011001000000000000100000000000000;
//-.1,-.2,-8,+2 avg=-1.575

#8 reset = 1 ;
#2 reset = 0 ;
input_value = 64'b1010000100011111101001010001111110101010011001101010011110101110;
//-.01,-.02,-0.05,-0.03 avg=-0.0275


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

