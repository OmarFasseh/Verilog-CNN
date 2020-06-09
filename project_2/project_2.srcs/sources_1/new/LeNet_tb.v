`timescale 1ns / 1ps
module LeNet_tb;
parameter PIPELINED_INPUTS = 2;
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH =10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
//fc
parameter FC_INPUT_SIZE1= 120; //Number of inputs
parameter FC_OUTPUT_SIZE1 = 84 ; //Number of outputs
parameter FC_INPUT_SIZE2= 84; //Number of inputs
parameter FC_OUTPUT_SIZE2 = 10; //Number of outputs
//parameter inputs_file_0 = "E:/VivadoFiles/finalT/edited_ones.txt";
parameter inputs_file_0 = "E:/VivadoFiles/finalT/av3_input_onestwos.txt";
parameter inputs_file_1 = "E:/VivadoFiles/finalT/av3_input_halfs+0.75.txt";
//parameter file_fc1 = "E:/VivadoFiles/finalT/hex_weightsdense_1.txt";//weights 1
//parameter file_fc2 = "E:/VivadoFiles/finalT/hex_weightsdense_2.txt";//weights 2
//remeber to pass parameters
parameter file_fc1 = "E:/VivadoFiles/finalT/weight_ones1.txt";//weights for fc1
parameter file_fc2 = "E:/VivadoFiles/finalT/weight_ones2.txt";//weights for fc2
//parameter inputs_file_1 = "E:/VivadoFiles/finalT/Inputs_FC_1.txt";
//parameter inputs_file_2 = "E:/VivadoFiles/finalT/Inputs_FC_2.txt";
//parameter inputs_file_3 = "E:/VivadoFiles/finalT/Inputs_FC_3.txt";

//PC_MF 
parameter N = 32; //The size of the image NxN
parameter filters_number = 6; //Number of filters

parameter number_of_filters3 = 120; //Number of filters 3rd conv
parameter filter3_file_1 = "E:/VivadoFiles/finalT/Conv3_FilterPerRow_ones.txt";
parameter filter3_file_2 = "E:/VivadoFiles/finalT/Conv3_FilterPerRow_twos.txt";
reg [120*25*DATA_WIDTH-1:0] PC3_filters;


//tanh
parameter numberOfInputs=84; 
//avg layer
parameter AVG3_DIMENSION = 10 ;
parameter AVG3_DIMENSION2 = (AVG3_DIMENSION/2)  ;
parameter AVG3_FILTER =16;
//softMax
parameter numberOfExps=10;

reg  [PIPELINED_INPUTS*(AVG3_FILTER*AVG3_DIMENSION*AVG3_DIMENSION*DATA_WIDTH)-1:0] input_leNet;
reg clk;
reg reset;
reg [AVG3_DIMENSION*AVG3_DIMENSION*DATA_WIDTH-1:0] inputs_mem [0:AVG3_FILTER-1] ;
reg [25*DATA_WIDTH-1:0] filters3[0:number_of_filters3-1];
wire [(DATA_WIDTH*FC_INPUT_SIZE2)-1:0] tanh6_output_value;
wire [(numberOfExps*DATA_WIDTH)-1:0] sm_output_value;
wire sm_done;

integer i;
initial begin
    //first input
    $readmemh(inputs_file_0, inputs_mem);
    for(i=0;i <FC_INPUT_SIZE1;i=i+1)
        input_leNet[(i+1)*AVG3_DIMENSION*AVG3_DIMENSION*DATA_WIDTH-1-:AVG3_DIMENSION*AVG3_DIMENSION*DATA_WIDTH] = inputs_mem[i];
    //second input
    $readmemh(inputs_file_1, inputs_mem);
    for(i=0;i <FC_INPUT_SIZE1;i=i+1)
        input_leNet[(AVG3_FILTER+i+1)*AVG3_DIMENSION*AVG3_DIMENSION*DATA_WIDTH-1-:AVG3_DIMENSION*AVG3_DIMENSION*DATA_WIDTH] = inputs_mem[i];    
    //Conv3 Filters
    $readmemh(filter3_file_1, filters3);
    for(i=0;i <number_of_filters3;i=i+1)
        PC3_filters[(i+1)*25*DATA_WIDTH-1-:25*DATA_WIDTH]=filters3[i]; //each file has 1 filter / row  
    /*
    $readmemh(filter3_file_2, filters3);
    for(i=0;i <number_of_filters3;i=i+1)
        PC3_filters[120*25*DATA_WIDTH+i*25*DATA_WIDTH+:25*DATA_WIDTH]=filters3[i]; //each file has 1 filter / row  
    */
    reset=0;
    clk=0;
    $stop; //used to apply needed breakpoints in the LeNet.v
    #2 reset =1;
    #20 reset =0;
    #5000;
    $stop;

end
always begin
    #1 clk = ~clk; // Toggle clock every 5 ticks 
end
LeNet #(.file_fc1(file_fc1),.file_fc2(file_fc1))
lN(.clk(clk),.reset(reset),.input_leNet(input_leNet),.PC3_filters(PC3_filters),.sm_output_value(sm_output_value),.sm_done(sm_done),.tanh6_output_value(tanh6_output_value));
endmodule
