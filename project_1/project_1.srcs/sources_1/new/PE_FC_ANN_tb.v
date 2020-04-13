//test bench for floating-point addition
module PE_FC_ANN_tb;
parameter DATA_WIDTH = 32;

    reg [DATA_WIDTH-1:0] input_fc;
    reg [DATA_WIDTH-1:0] iweight_FC;
    reg clock , start_FC;
    wire [DATA_WIDTH-1:0] output_fc;

   
    initial //apply input vectors
    begin
     clock = 1;
       
        #0 iweight_FC = 32'hbb0fc453;
           input_fc = 32'h3a8ea4f3;
            start_FC=1;
         #250 iweight_FC = 32'h41a00000;
              input_fc = 32'h40a00000;
              start_FC=0;  
         #250 iweight_FC = 32'h42340000;
                input_fc = 32'h41f00000;
                start_FC=0;   
                #250 iweight_FC = 32'h42a00000;
                                input_fc = 32'h429e0000;
                                start_FC=0;  
        #500 $stop;
    end
    always begin
        #5  clock = ~clock; // Toggle clock every 5 ticks :(
     end
    PE_FC_ANN PE_FC_ANN1 ( //instantiate the module
    .input_fc(input_fc),
    .iweight_FC(iweight_FC),
    .clk(clock),
    .start_FC(start_FC),
    .output_fc(output_fc));
endmodule