//test bench for exp
`timescale 1ns / 1ps
module tanh_activation_function_tb;

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter numberOfInputs=84; 

reg [((EXPONENT_WIDTH+MANTISSA_WIDTH+1)*numberOfInputs)-1:0] input_value;
reg clock;
reg reset;
wire [((EXPONENT_WIDTH+MANTISSA_WIDTH+1)*numberOfInputs)-1:0] output_value;

initial
begin
clock =1;
reset=1;
//  e^2
// s ----e---- --------------f-------------
//input_value = 192'b010000000000000000000000000000000100000001000000000000000000000001000000010110011001100110011010110000000000000000000000000000001011111110011001100110011001101001000000101000000000000000000000;
input_value = 1344'h5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780_5780;
#2 reset =0; 
#250 $stop;
end 


always begin
     #1  clock = ~clock; 
    end
        
//instantiate the module into the test bench
tanh_activation_function #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .numberOfInputs(numberOfInputs)) inst1 (
.input_tanh_function(input_value),
.clk(clock),
.reset(reset),
.output_tanh_function(output_value)
);
endmodule


