//test bench for floating-point addition
`timescale 1ns / 1ps
module PE_FC_ANN_tb;
parameter DATA_WIDTH = 32;

    reg [DATA_WIDTH-1:0] input_fc;
    reg [DATA_WIDTH-1:0] iweight_FC;
    reg clock , start_FC;
    wire [DATA_WIDTH-1:0] output_fc;
    wire [DATA_WIDTH-1:0] test_multi;

   
    initial //apply input vectors
    begin
     clock = 0;
       
        #0 iweight_FC = 32'hbb0fc453;
           input_fc = 32'h3a8ea4f3;
            start_FC=1;
         #2 iweight_FC = 32'h41a00000; //20 
              input_fc = 32'h40a00000; //5
              start_FC=0;
         #4 iweight_FC = 32'h42340000;
                input_fc = 32'h41f00000;  
         #4 iweight_FC = 32'h42a00000;
            input_fc = 32'h429e0000;
        #4 $stop;
    end
always begin
        // Toggle clock every 5 ticks :(
     #3  clock = ~clock;
     #1  clock = ~clock; 
    end
    PE_FC_ANN PE_FC_ANN1 ( //instantiate the module
    .input_fc(input_fc),
    .iweight_FC(iweight_FC),
    .clk(clock),
    .start_FC(start_FC),
    .output_fc(output_fc),
    .test_multi(test_multi));
endmodule