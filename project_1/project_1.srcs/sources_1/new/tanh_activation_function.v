`timescale 1ns / 1ns
module tanh_activation_function(input_tanh_function, clk, output_tanh_function);

parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
parameter numberOfInputs=10; 

input [(DATA_WIDTH*numberOfInputs)-1:0] input_tanh_function;
input clk;
output wire [(DATA_WIDTH*numberOfInputs)-1:0]output_tanh_function;

genvar i;

generate  //generate the parallel processing elements
	for (i=0; i < numberOfInputs; i=i+1) 
	begin  
	tanh #(.DATA_WIDTH(DATA_WIDTH),.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) 
	tanh_calc (
	 .input_x(input_tanh_function[DATA_WIDTH*i+:DATA_WIDTH]),
	 .clk(clk),
	 .output_tanh(output_tanh_function[DATA_WIDTH*i+:DATA_WIDTH])
	);
	
	end
endgenerate 



endmodule