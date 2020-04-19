`timescale 1ns / 1ps
module SingleLayer(input_fc, clk, start_fc, reset, output_fc_final);
parameter DATA_WIDTH = 32 ; 
parameter INPUT_SIZE= 100; //Number of inputs
parameter OUTPUT_SIZE = 32 ; //Number of outputs
parameter ADDR_WIDTH = 9 ; 
parameter file = "E:/trashCan/a.txt";
input  [(DATA_WIDTH*INPUT_SIZE)-1:0] input_fc;
input clk, start_fc, reset;
output [(DATA_WIDTH*OUTPUT_SIZE)-1:0] output_fc_final;

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

always @ (posedge reset) begin
    i = 0;
    //$stop;
end

always @ (negedge clk) begin
    address_fc = i;
    read_en_MM = 1;
    enable_MM_out = 1;
end

always @ (posedge clk) begin
    if(i < INPUT_SIZE) begin
        FC_LAYER_INPUT = input_fc[(i*DATA_WIDTH)+:DATA_WIDTH-1];
        i = i+1;
        relu_flag=0;
    end else begin
        //$stop;
        relu_flag = 1;
    end
end

//Weights module to read the weights from the memory
weights_Memory #(.parallel_fc_PE(OUTPUT_SIZE),
.file(file))
wm(.clk(clk),
.address_fc(address_fc),
.read_en_MM_fc(read_en_MM) ,
.dataMainMemo_fc(weights),
.enable_MM_out_fc(enable_MM_out));

//The FC_LAYER responsible to multiply x by their weights and accumalate
FC_Layer_ANN FC(.input_fc(FC_LAYER_INPUT),
.weightCaches_fc(weights),
.clk(clk),
.start_FC(start_fc),
.output_fc(output_fc)); //inside loop

//ReLu to call when done calculating
ReLU relu(.input_fc(output_fc) ,.output_fc(output_fc_final),.f_flag(relu_flag));

endmodule