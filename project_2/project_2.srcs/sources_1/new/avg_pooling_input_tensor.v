`timescale 1ns / 1ps
module avg_pooling_input_tensor(
imgs_in,
clk,reset_module,
imgs_out
);
//4clks/filter 
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
parameter filter =6; //24 clk // the number of images
parameter dimension = 28 ; //dimension of input matrix
parameter dimension2 = (dimension/2); //dimension of output matrix
input [(filter*dimension*dimension*DATA_WIDTH)-1:0] imgs_in;
input clk ;
input reset_module;
output reg [(filter*dimension2*dimension2*DATA_WIDTH)-1:0] imgs_out;
reg [(dimension*dimension*DATA_WIDTH)-1:0] temp_img ;
wire [(dimension2*dimension2*DATA_WIDTH)-1:0] temp_out ;
reg reset=1;
integer i=0;
integer j=0;
reg start=0;
/*
Firstly 
check for start I send the first image for average layer module that calculated the average for one image 
and make start = 0 to no enter it again and wait to 8 ticks to finish it and then take output 
and make reset to inner module to can send another image to it and then make also for rest of images

*/
always@(posedge clk) 
begin
if(start==0) //send first image when start = 0 
begin
temp_img = imgs_in[0+:dimension*dimension*DATA_WIDTH];
start=1; // make start=1 to not enter this if 
reset=0; //this reset for inner module to send new data
end else begin 
i=i; 
end
if(reset_module)begin  // check of I Want to reset the module and send anther input 
    i=0;    
    start=0;
    j=0; 
    reset=1;
end else begin 
    i=i; 
    end
j=j+1; // this like clk ticks to can pass input and take output on time
if(i<filter && (j==10)) // check on clk ticks and the index of 3d array bigger than number of images to pass new input  
begin
      reset=0;
       j=0;    
       temp_img = imgs_in[i*dimension*dimension*DATA_WIDTH+:dimension*dimension*DATA_WIDTH];
       
end else begin 
i=i; 
end

if(j==8)//this time of take image of inner module after 8 clock tickes
begin
  imgs_out[i*dimension2*dimension2*DATA_WIDTH+:dimension2*dimension2*DATA_WIDTH]= temp_out; 
i=i+1;
reset=1; //make reset =1 to reset inner Variables
end else begin 
i=i; 
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