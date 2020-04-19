`timescale 1ns / 1ps
module SingleLayer();
parameter DATA_WIDTH = 32 ; //float
parameter INPUT_SIZE= 100; 
parameter OUTPUT_SIZE = 32 ;
parameter ADDR_WIDTH = 9 ;
parameter file = "E:/trashCan/a.txt";
//input [DATA_WIDTH-1:0] input_fc;
//input start_FC, clk;
input  [DATA_WIDTH*INPUT_SIZE-1:0] input_fc;
input clk;
output [DATA_WIDTH*OUTPUT_SIZE-1:0] output_fc;

reg [ADDR_WIDTH-1:0] address_fc; //         ALLEZ BITCHEZ
reg [(DATA_WIDTH*OUTPUT_SIZE-1):0] weights;
reg       read_en_MM,enable_MM_out;


weights_Memory #(.parallel_fc_PE(OUTPUT_SIZE),.file(file)) wm(.clk(clk),.address_fc(address_fc),.read_en_MM_fc(read_en_MM) ,.dataMainMemo_fc(weights),.enable_MM_out_fc(enable_MM_out)) ;

FC_Layer_ANN(.input_fc(),.weightCaches_fc, .clk,.start_FC,.output_fc); //inside loop

endmodule
