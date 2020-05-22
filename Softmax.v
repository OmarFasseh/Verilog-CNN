`timescale 1ns / 1ns
module Softmax( input_exps, clk, output_softmax,done_softmax );

parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;

parameter parallel_exps= 32; //number of outputs (cols)
parameter DATA_WIDTH_OUT = 32 ; //float
parameter numberOfExps=10; 
parameter numberOfAdditions=5;

input [(DATA_WIDTH*numberOfExps)-1:0] input_exps;
input clk;
output reg [(DATA_WIDTH*5)-1:0]output_softmax;
output reg done_softmax;

wire done_exp;
wire [(DATA_WIDTH*5-1):0] output_tmp_add;
wire [(numberOfExps*DATA_WIDTH)-1:0]output_exps;

reg [(DATA_WIDTH*numberOfExps)/2-1:0] adder_input_one;
reg [(DATA_WIDTH*numberOfExps)/2-1:0] adder_input_two;

reg [4:0] clkCounter=0;

genvar i;

generate  //generate the parallel processing elements
	for (i=0; i < numberOfExps; i=i+1) 
	begin :exp 
	exponential #(.DATA_WIDTH(DATA_WIDTH),.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) 
	exps (
	 .input_exp(input_exps[DATA_WIDTH*i+:DATA_WIDTH]),
	.output_exp(output_exps[DATA_WIDTH*i+:DATA_WIDTH]),
	.clk(clk),
	.done_exp(done_exp)
	);
	
	end
endgenerate 

genvar j;
generate  //generate the parallel processing elements
	for (j=0; j < numberOfAdditions; j=j+1) 
	begin :add 
    fp_add_2 #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) fadd(
    .A_FP(adder_input_one[DATA_WIDTH*j+:DATA_WIDTH]),
    .B_FP(adder_input_two[DATA_WIDTH*j+:DATA_WIDTH]),
    .sign(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH + DATA_WIDTH*j]),
    .exponent(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH-1 + DATA_WIDTH*j :MANTISSA_WIDTH + DATA_WIDTH*j]),
    .mantissa(output_tmp_add[MANTISSA_WIDTH-1+ DATA_WIDTH*j:0+ DATA_WIDTH*j]),
    .clk(clk)
    );
	
	end
endgenerate
 
reg [4:0]z;
always @ (posedge clk && done_exp)
begin
    if(clkCounter==0)
    begin
          for(z=0;z<5; z=z+1)
          begin
                adder_input_one[DATA_WIDTH*z+:DATA_WIDTH]= output_exps[DATA_WIDTH*z*2+:DATA_WIDTH];  
                adder_input_two[DATA_WIDTH*z+:DATA_WIDTH]= output_exps[DATA_WIDTH*(z*2+1)+:DATA_WIDTH];    
          end
    end
    else if(clkCounter==1)
    begin
           for(z=0;z<2; z=z+1)
            begin
                  adder_input_one[DATA_WIDTH*z+:DATA_WIDTH]= output_tmp_add[DATA_WIDTH*(z*2)+:DATA_WIDTH];  
                  adder_input_two[DATA_WIDTH*z+:DATA_WIDTH]= output_tmp_add[DATA_WIDTH*((z*2)+1)+:DATA_WIDTH];    
           //$stop;
            end
    end
    else if(clkCounter==2)
    begin
              adder_input_one[31:0]= output_tmp_add[31:0];  
              adder_input_two[31:0]= output_tmp_add[63:32];    
    end
    else if(clkCounter==3)
    begin
             adder_input_one[31:0]= output_tmp_add[31:0];  
             adder_input_two[31:0]= output_tmp_add[159:128];    
    end
    else
    begin
        
    end
    
    clkCounter=clkCounter+1;
   //$stop;
end

always @ (posedge clk && done_exp)
begin
    if(clkCounter==5)
    begin
    
       output_softmax=output_tmp_add;
       done_softmax=1;
    end
   /* else if(clkCounter==1)
    begin
    output_softmax[95:32]=output_tmp_add[63:0];
    end*/
   
end  
   
   // done_softmax=1;
endmodule