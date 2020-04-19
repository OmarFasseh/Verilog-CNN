`timescale 1ns / 1ps
module ReLU_tb;
parameter parallel_fc_PE = 2; // # of wights per input
parameter DATA_WIDTH= 32 ;
reg [(parallel_fc_PE*DATA_WIDTH)-1 : 0] input_fc;
reg  flag;
wire [(parallel_fc_PE*DATA_WIDTH)-1 : 0] output_fc;


initial
begin

flag =0;
#0 input_fc= 64'b0100001000010000000000000000000011000010110001100000000000000000;
flag = 1 ;

#20 flag = 0;

#20 input_fc =64'b0100001000010000000000000000111111000010110001100100000000000111; 
flag = 1;

#20 $stop;



end

ReLU test (.input_fc(input_fc) ,.output_fc(output_fc),.f_flag(flag));
endmodule
