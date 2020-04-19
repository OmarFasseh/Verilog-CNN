`timescale 1ns / 1ps
module SingleLayer_tb;
parameter DATA_WIDTH = 32 ; 
parameter INPUT_SIZE= 100; //Number of inputs
parameter OUTPUT_SIZE = 32 ; //Number of outputs
parameter ADDR_WIDTH = 9 ; 
parameter file = "E:/trashCan/Weights_FC_0_ones";
parameter inputs_file_0 = "E:/trashCan/Inputs_FC_0.txt";
reg  [DATA_WIDTH*INPUT_SIZE-1:0] input_fc;
reg clk, start_fc, reset;
wire [DATA_WIDTH*OUTPUT_SIZE-1:0] output_fc_final;
reg [DATA_WIDTH-1:0] inputs_mem [0:INPUT_SIZE-1] ; // inputs_mem[0] --> 32bit
    integer i;
    initial //apply input vectors
    begin
    $readmemh(inputs_file_0, inputs_mem); // memory_list is memory file
    for( i = 0;i <INPUT_SIZE;i=i+1)
        input_fc[i*DATA_WIDTH+:DATA_WIDTH] = inputs_mem[i];
    reset=1; 
    start_fc=1;
    clk = 1; 
    //input_fc= 3168'hFFFFFFFFFFFFbb0f;
    #10000 start_fc=0;   
        reset =0;
        //input_fc= 3168'hFFFFFFFFFFFFbb0f;
        
   // #10 input_fc= 16'hcc0f;
    #10000 start_fc=0;   
         //input_fc= 3168'hFFFFFFFFFFFFbb0f;
    
    #1000 $stop;
    end
    always begin
        #5  clk = ~clk; // Toggle clock every 5 ticks :(
     end
SingleLayer #(.INPUT_SIZE(INPUT_SIZE), .file(file))//instantiate the module                                                     
SL( .input_fc(input_fc),
    .clk(clk),
    .start_fc(start_fc),
    .reset(reset),
    .output_fc_final(output_fc_final));
endmodule