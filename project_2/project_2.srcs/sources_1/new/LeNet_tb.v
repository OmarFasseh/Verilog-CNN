`timescale 1ns / 1ps
module LeNet_tb;
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH =10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
//fc
parameter FC_INPUT_SIZE1= 120; //Number of inputs
parameter FC_OUTPUT_SIZE1 = 84 ; //Number of outputs
parameter FC_INPUT_SIZE2= 84; //Number of inputs
parameter FC_OUTPUT_SIZE2 = 10; //Number of outputs
parameter inputs_file_0 = "E:/VivadoFiles/finalT/edited_ones.txt";
//parameter file_fc1 = "E:/VivadoFiles/finalT/hex_weightsdense_1.txt";//weights 1
//parameter file_fc2 = "E:/VivadoFiles/finalT/hex_weightsdense_2.txt";//weights 2
parameter file_fc1 = "E:/VivadoFiles/finalT/weight_ones1.txt";//weights 1
parameter file_fc2 = "E:/VivadoFiles/finalT/weight_ones1.txt";//weights 2
//parameter inputs_file_1 = "E:/VivadoFiles/finalT/Inputs_FC_1.txt";
//parameter inputs_file_2 = "E:/VivadoFiles/finalT/Inputs_FC_2.txt";
//parameter inputs_file_3 = "E:/VivadoFiles/finalT/Inputs_FC_3.txt";

//PC_MF 
parameter N = 32; //The size of the image NxN
parameter filters_number = 2; //Number of filters
//tanh
parameter numberOfInputs=84; 
//avg layer
parameter dimension = 4 ;
parameter dimension2 = (dimension/2)  ;
//softMax
parameter numberOfExps=10;

reg  [DATA_WIDTH*FC_INPUT_SIZE1-1:0] input_fc1;
reg clk;
reg reset;
reg [DATA_WIDTH-1:0] inputs_mem [0:FC_INPUT_SIZE1-1] ;
wire [(DATA_WIDTH*FC_INPUT_SIZE2)-1:0] tanh6_output_value;
wire [(numberOfExps*DATA_WIDTH)-1:0] sm_output_value;
wire sm_done;

integer i;
initial begin
    $readmemh(inputs_file_0, inputs_mem);
    for( i = 0;i <FC_INPUT_SIZE1;i=i+1)
        input_fc1[i*DATA_WIDTH+:DATA_WIDTH] = inputs_mem[i];
    reset=0;
    clk=0;
    #2 reset =1;
    #20 reset =0;
    #5000;
        $stop;

end
always begin
    #1 clk = ~clk; // Toggle clock every 5 ticks 
end
LeNet lN(.clk(clk),.reset(reset),.input_leNet(input_fc1),.sm_output_value(sm_output_value),.sm_done(sm_done),.tanh6_output_value(tanh6_output_value));
endmodule
