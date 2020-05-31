`timescale 1ns / 1ps
module fp_avg(fp_input ,clk, fp_output,reset);
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1 ;

input [((4*DATA_WIDTH)-1):0] fp_input;
input clk ;
output wire[DATA_WIDTH-1:0] fp_output ;
wire done ;
integer i ;
reg  finish ;
input reset ;

reg [DATA_WIDTH-1:0] add_1;
reg [DATA_WIDTH-1:0] add_2;
wire [DATA_WIDTH-1:0] sum;
reg [DATA_WIDTH-1:0] avg ;

initial 
begin
    i=1;//set the order of operations
   finish = 0; 
end

always@(negedge clk)
begin
if(reset ==1 ) //check on reset of to put reset finish   
begin
finish =0 ;
i=1 ;
end
else if(finish ==0) //if check of not finished
begin
if(i==1)
begin       //Pass first two element to adder to add them 
 add_1 = fp_input[1*(DATA_WIDTH-1):0] ;
 add_2 = fp_input[((2*DATA_WIDTH)-1):DATA_WIDTH] ;
i=i+1 ;
end


else if(i==2) //Add the result of first two number with the third one
begin
  add_1 = sum ; 
  add_2 = fp_input[((3*DATA_WIDTH)-1):(2*DATA_WIDTH)] ;
  i=i+1 ;
end

else if(i==3) //Add the result of first three number with the fourth one
begin
  add_1 = sum ;
  add_2 = fp_input[((4*DATA_WIDTH)-1):(3*DATA_WIDTH)] ;
  i=i+1 ;
end
else if(i==4) // Pass the summation of the four number to divide on 4 
begin
 avg = sum ;
 //$stop;
i=i+1;
end
else if(i==5) //reset the parameters and make set finish
begin
 add_1 = 0;
add_2 = 0 ;
finish =1 ;
end
end
end




fp_div #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) inst1 (
.flp_a(avg),
.sign(fp_output[EXPONENT_WIDTH+MANTISSA_WIDTH]),
.exponent(fp_output[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]),
.prod(fp_output[MANTISSA_WIDTH-1:0]),
.clk(clk)
);


fp_add_2 #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) fadd(
.A_FP(add_1),
.B_FP(add_2),
.sign(sum[EXPONENT_WIDTH+MANTISSA_WIDTH]),
.exponent(sum[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]),
.mantissa(sum[MANTISSA_WIDTH-1:0]),
.clk(clk),
.done(done)
);

endmodule