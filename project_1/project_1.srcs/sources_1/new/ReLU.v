/*`timescale 1ns / 1ps
module ReLU(input_fc, clk,start_FC,output_fc);
parameter DATA_WIDTH = 32 ; //float
parameter parallel_fc_PE= 32; //number of cols
parameter DATA_WIDTH_OUT = 32 ; //float
input [(parallel_fc_PE*DATA_WIDTH_OUT )-1:0] input_fc;
input start_FC, clk;
input  [(DATA_WIDTH*parallel_fc_PE)-1:0] weightCaches_fc;
output output_fc;

genvar i;
generate 
	for (i=0; i < parallel_fc_PE; i=i+1) 
	begin :PE 
	FC_Layer_ANN FCs (
	 .input_fc   (input_fc),
	 .iweight_FC (weightCaches_fc[DATA_WIDTH*i+:DATA_WIDTH]),
	 .clk(clk),.start_FC(start_FC),
	.output_fc(output_fc[DATA_WIDTH_OUT*i+:DATA_WIDTH_OUT])
	);
	end//me
endgenerate 

endmodule
*/