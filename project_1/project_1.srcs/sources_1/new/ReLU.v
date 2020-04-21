`timescale 1ns / 1ps
module ReLU(input_fc ,output_fc,f_flag);
parameter DATA_WIDTH = 32 ; //float
parameter parallel_fc_PE= 32; //number of cols
parameter DATA_WIDTH_OUT = 32 ; //float
input [(parallel_fc_PE*DATA_WIDTH_OUT )-1:0] input_fc;
input f_flag;
output reg [(parallel_fc_PE*DATA_WIDTH_OUT )-1:0] output_fc;
integer i;

always@(posedge f_flag)
begin
    for (i=0; i < parallel_fc_PE; i=i+1) 
        output_fc[DATA_WIDTH*i +: DATA_WIDTH] = input_fc[DATA_WIDTH*i+ DATA_WIDTH-1] == 1'b1 ? 32'b0 : input_fc[DATA_WIDTH*i +: DATA_WIDTH] ;
end


endmodule