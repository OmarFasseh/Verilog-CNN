`timescale 1ns / 1ps
module avg_pooling_input_tensor(
imgs_in,
clk,
imgs_out
);

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
parameter filter =6;
parameter dimension = 2 ; //dimension of input matrix
parameter dimension2 = (dimension/2); //dimension of output matrix
input [(filter*dimension*dimension*DATA_WIDTH)-1:0] imgs_in;
input clk ;
output reg [(filter*dimension2*dimension2*DATA_WIDTH)-1:0] imgs_out;
reg [(dimension*dimension*DATA_WIDTH)-1:0] temp_img ;
wire [(dimension2*dimension2*DATA_WIDTH)-1:0] temp_out ;
reg reset;
integer i=0;
integer j=0;
reg start=0;
initial 
begin

end

always@(posedge clk)
begin

if(start==0)
begin
temp_img = imgs_in[0+:dimension*dimension*DATA_WIDTH];
start=1;
reset=0;
end

j=j+1;
if(i<filter && (j==10))
begin
      reset=0;
   // temp_img={(imgs_in[(i*dimension*dimension*DATA_WIDTH)-1]),(imgs_in[(i-1)*dimension*dimension*DATA_WIDTH])};
       j=0;    
       temp_img = imgs_in[i*dimension*dimension*DATA_WIDTH+:dimension*dimension*DATA_WIDTH];
       
end 

if(j==8)
begin
  imgs_out[i*dimension2*dimension2*DATA_WIDTH+:dimension2*dimension2*DATA_WIDTH]= temp_out; 
i=i+1;
reset=1;
end

end
   
avg_layer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .dimension(dimension),
.DATA_WIDTH(DATA_WIDTH)) 
inst1 (
.img_in(temp_img),
.clk(clk),
.img_out(temp_out),
.reset(reset)
);  
    
endmodule