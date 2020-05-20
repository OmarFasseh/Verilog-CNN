`timescale 1ns / 1ps
module SingleLayer(input_fc, clk, start_fc, reset,output_fc_final,test_multi,test_weights,test_output,done);
parameter DATA_WIDTH = 32 ; 
parameter INPUT_SIZE= 1000; //Number of inputs
parameter OUTPUT_SIZE = 32 ; //Number of outputs
parameter ADDR_WIDTH = 9 ; 
parameter file = "C:/Users/giga/Documents/weights1_modified.txt";
input  [(DATA_WIDTH*(INPUT_SIZE))-1:0] input_fc;
input clk, start_fc, reset , done;
output [(DATA_WIDTH*OUTPUT_SIZE)-1:0] output_fc_final;
output [(DATA_WIDTH*OUTPUT_SIZE)-1:0] test_multi;
output reg [(DATA_WIDTH*OUTPUT_SIZE)-1:0] test_weights;
output reg [(DATA_WIDTH*OUTPUT_SIZE)-1:0] test_output;

reg [ADDR_WIDTH-1:0] address_fc; 
reg read_en_MM;
reg enable_MM_out;
reg [DATA_WIDTH-1:0] FC_LAYER_INPUT;
reg relu_flag;
wire [(DATA_WIDTH*OUTPUT_SIZE)-1:0] weights;
wire [DATA_WIDTH*OUTPUT_SIZE-1:0] output_fc;
wire start_FC ;
wire reset;


integer i;

always @ (posedge reset) begin //initial values
    i = 0;
    address_fc = 0;
    relu_flag = 0;
end
always @(posedge done) begin //start the relu
    relu_flag = 1;
end
always @ (negedge clk) begin  
    read_en_MM = 1;
    enable_MM_out = 1;
    test_weights = weights;
    test_output = output_fc;
end

always @ (posedge clk) begin 
    if(~reset && ~done) //increment the  memory address if running
        address_fc = address_fc +1;
        
    if(i < INPUT_SIZE) begin //looping input fc
        FC_LAYER_INPUT = input_fc[(i*DATA_WIDTH)+:DATA_WIDTH-1];
        i = i+1;
        relu_flag=0;
    end 
           
end

//Weights module to read the weights from the memory
weights_Memory #(.parallel_fc_PE(OUTPUT_SIZE),.file(file),.fc_columns(INPUT_SIZE),.tot_weight_size(INPUT_SIZE*OUTPUT_SIZE))
wm(.clk(clk),
.address_fc(address_fc),
.read_en_MM_fc(read_en_MM) ,
.dataMainMemo_fc(weights),
.enable_MM_out_fc(enable_MM_out));

//The FC_LAYER responsible to multiply x by their weights and accumalate
FC_Layer_ANN #(.parallel_fc_PE(OUTPUT_SIZE),.DATA_WIDTH(DATA_WIDTH))
FC(.input_fc(FC_LAYER_INPUT),
.weightCaches_fc(weights),
.clk(clk),
.start_FC(start_fc),
.output_fc(output_fc),
.test_multi(test_multi)); //inside loop

//ReLu to call when done calculating
ReLU #(.parallel_fc_PE(OUTPUT_SIZE),.DATA_WIDTH(DATA_WIDTH))
relu(.input_fc(output_fc) ,.output_fc(output_fc_final),.f_flag(relu_flag));

endmodule