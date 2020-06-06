`timescale 1ns / 1ps
module Pipeline_tb;
parameter DATA_WIDTH = 32 ; 
parameter INPUT_SIZE= 100; //Number of inputs
parameter OUTPUT_SIZE_1 = 32 ; //Number of outputs layer 1|| inputs for layer 2
parameter OUTPUT_SIZE_2 = 10 ; //Number of outputs layer 2|| inputs for layer 3
parameter OUTPUT_SIZE_3 = 4 ; //Number of outputs layer 3
parameter ADDR_WIDTH = 9 ; 
parameter file1 = "E:/VivadoFiles/Weights_FC_0_ones.txt";
parameter file2 = "E:/VivadoFiles/Weights_FC_1_ones.txt";
parameter file3 = "E:/VivadoFiles/Weights_FC_2_ones.txt";
parameter inputs_file_0 = "E:/VivadoFiles/Inputs_FC_0.txt";

reg  [DATA_WIDTH*INPUT_SIZE-1:0] input_fc;
reg clk, start_fc_1,start_fc_2,start_fc_3 , reset, done_1, done_2, done_3;
reg [DATA_WIDTH*OUTPUT_SIZE_1-1:0] output_fc_buffer_1;
reg [DATA_WIDTH*OUTPUT_SIZE_2-1:0] output_fc_buffer_2;
reg [DATA_WIDTH-1:0] inputs_mem [0:INPUT_SIZE-1] ;
reg [DATA_WIDTH*OUTPUT_SIZE_3-1:0] input1_final_ans;
reg [DATA_WIDTH*OUTPUT_SIZE_3-1:0] input2_final_ans;
reg [DATA_WIDTH*OUTPUT_SIZE_3-1:0] input3_final_ans;

wire [DATA_WIDTH*OUTPUT_SIZE_1-1:0] output_fc_layer_1;
wire [DATA_WIDTH*OUTPUT_SIZE_2-1:0] output_fc_layer_2;
wire [DATA_WIDTH*OUTPUT_SIZE_3-1:0] output_fc_layer_3;
wire [(DATA_WIDTH*OUTPUT_SIZE_1)-1:0] test_multi;
wire [(DATA_WIDTH*OUTPUT_SIZE_1)-1:0] test_weights;
wire [(DATA_WIDTH*OUTPUT_SIZE_1)-1:0] test_output;
integer i;

initial
    begin
    $readmemh(inputs_file_0, inputs_mem);
    for( i = 0;i <INPUT_SIZE;i=i+1)
        input_fc[i*DATA_WIDTH+:DATA_WIDTH] = inputs_mem[i];
    reset=0;
    #1 reset=1; 
    start_fc_1=1;
    start_fc_2=1;
    start_fc_3=1;
    clk = 0;
    done_1 =0;
    done_2 =0;
    done_3 =0; 

    #20 reset =0;
    start_fc_1=0;

    #1000 done_1 = 1;
    assign output_fc_buffer_1=output_fc_layer_1;
    
    #20 reset=1; 
    start_fc_2=1;

    #20 reset =0;
    start_fc_2=0;

    #320 done_2 = 1;
    assign output_fc_buffer_2=output_fc_layer_2;

    #20 reset=1; 
    start_fc_3=1;

    #20 reset =0;
    start_fc_3=0;

    #100 done_3 = 1;
    assign input1_final_ans=output_fc_layer_3;
              
    end
integer j;
    initial begin
        #1020
        $readmemh(inputs_file_0, inputs_mem);
        for( j = 0;j <INPUT_SIZE;j=j+1)
            input_fc[j*DATA_WIDTH+:DATA_WIDTH] = inputs_mem[j];
        reset=1; 
        start_fc_1=1;
        start_fc_2=1;
        start_fc_3=1;
        clk = 0;
        done_1 =0;
        done_2 =0;
        done_3 =0;

        #20 reset =0;
        start_fc_1=0;
        #1000 done_1 = 1;
        assign output_fc_buffer_1=output_fc_layer_1;
        
        #20 reset=1; 
        start_fc_2=1;

        #20 reset =0;
        start_fc_2=0;
        
        #320 done_2 = 1;
        assign output_fc_buffer_2=output_fc_layer_2;
        #20 reset=1; 
        start_fc_3=1;

        #20 reset =0;
        start_fc_3=0;

        #100 done_3 = 1;
        assign  input2_final_ans=output_fc_layer_3;
                  
    end

 integer k;
    initial begin
        #2040 $readmemh(inputs_file_0, inputs_mem);
        for( k = 0;k <INPUT_SIZE;k=k+1)
            input_fc[j*DATA_WIDTH+:DATA_WIDTH] = inputs_mem[k];
        reset=1; 
        start_fc_1=1;
        start_fc_2=1;
        start_fc_3=1;
        clk = 0;
        done_1 =0;
        done_2 =0;
        done_3 =0;

        #20 reset =0;
        start_fc_1=0;
        
        #1000 done_1 = 1;
        assign output_fc_buffer_1=output_fc_layer_1;
        
        #20 reset=1; 
        start_fc_2=1;

        #20 reset =0;
        start_fc_2=0;
         
        #320 done_2 = 1;
        assign output_fc_buffer_2=output_fc_layer_2;
        #20 reset=1; 
        start_fc_3=1;

        #20 reset =0;
        start_fc_3=0;

        #100 done_3 = 1;
        input3_final_ans=output_fc_layer_3;

        #100;          
    end
    always begin
        #5  clk = ~clk; // Toggle clock every 5 ticks 
    end
    
SingleLayer #(.INPUT_SIZE(INPUT_SIZE), .file(file1), .OUTPUT_SIZE(OUTPUT_SIZE_1)) //instantiate the module                                                     
SL1( .input_fc(input_fc),
    .clk(clk),
    .start_fc(start_fc_1),
    .reset(reset),
    .output_fc_final(output_fc_layer_1),
    .test_multi(test_multi),.test_weights(test_weights),.test_output(test_output),.done(done_1));
    
SingleLayer #(.INPUT_SIZE(OUTPUT_SIZE_1), .file(file2), .OUTPUT_SIZE(OUTPUT_SIZE_2)) //instantiate the module                                                     
SL2( .input_fc(output_fc_buffer_1),
    .clk(clk),
    .start_fc(start_fc_2),
    .reset(reset),
    .output_fc_final(output_fc_layer_2),
    .test_multi(test_multi),.test_weights(test_weights),.test_output(test_output),.done(done_2));
    
SingleLayer #(.INPUT_SIZE(OUTPUT_SIZE_2), .file(file3), .OUTPUT_SIZE(OUTPUT_SIZE_3)) //instantiate the module                                                     
SL3( .input_fc(output_fc_buffer_2),
    .clk(clk),
    .start_fc(start_fc_3),
    .reset(reset),
    .output_fc_final(output_fc_layer_3),
    .test_multi(test_multi),.test_weights(test_weights),.test_output(test_output),.done(done_3));               
endmodule
