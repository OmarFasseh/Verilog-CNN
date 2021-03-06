`timescale 1ns / 1ns
module Softmax( input_exps, clk, output_softmax,done_softmax,reset_softmax );

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;

//parameter parallel_exps= 32; //number of outputs (cols)
parameter DATA_WIDTH_OUT = 32 ; //float
parameter numberOfExps=10; 
parameter numberOfAdditions=5;

input [(DATA_WIDTH*numberOfExps)-1:0] input_exps;
input clk,reset_softmax;
output reg [(numberOfExps*DATA_WIDTH)-1:0]output_softmax;
output reg done_softmax;

wire done_exp;
wire [(DATA_WIDTH*5-1):0] output_tmp_add;

wire [(numberOfExps*DATA_WIDTH)-1:0]output_exps;

reg [(DATA_WIDTH*numberOfExps)/2-1:0] adder_input_one;
reg [(DATA_WIDTH*numberOfExps)/2-1:0] adder_input_two;

wire [(numberOfExps*DATA_WIDTH)-1:0] output_tmp_div;
reg [(numberOfExps*DATA_WIDTH)-1:0] divider_input_one;
reg [DATA_WIDTH-1:0] divider_input_two;
wire div_done;
reg div_reset=0;
reg div_start=0;

reg [4:0] clkCounter=0;
reg done_adders=0;
genvar i;
generate  //generate the parallel exponent elements
	for (i=0; i < numberOfExps; i=i+1) 
	begin :exp 
	exponential #(.DATA_WIDTH(DATA_WIDTH),.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) 
	exps (
	 .input_exp(input_exps[DATA_WIDTH*i+:DATA_WIDTH]),
	.output_exp(output_exps[DATA_WIDTH*i+:DATA_WIDTH]),
	.clk(clk),
	.done_exp(done_exp),
	.reset_exp(reset_softmax)
	);
	end
endgenerate 

genvar j;
generate  //generate the parallel adders elements
	for (j=0; j < numberOfAdditions; j=j+1) 
	begin :add 
    fp_add_2 #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) fadd(
    .A_FP(adder_input_one[DATA_WIDTH*j+:DATA_WIDTH]),
    .B_FP(adder_input_two[DATA_WIDTH*j+:DATA_WIDTH]),
    .sign(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH + DATA_WIDTH*j]),
    .exponent(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH-1 + DATA_WIDTH*j :MANTISSA_WIDTH + DATA_WIDTH*j]),
    .mantissa(output_tmp_add[MANTISSA_WIDTH-1+ DATA_WIDTH*j:0+ DATA_WIDTH*j]),
    .clk(clk),
    .done()
    );
	
	end
endgenerate
 
 
 genvar k;
generate  //generate the parallel dividers elements
    for (k=0; k < numberOfExps; k=k+1) 
	begin :div
     fpDiv #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) inst1 (
    .flp_a(divider_input_one[DATA_WIDTH*k+:DATA_WIDTH]),
    .flp_b(divider_input_two[DATA_WIDTH-1:0]),
    .sign(output_tmp_div[EXPONENT_WIDTH+MANTISSA_WIDTH + DATA_WIDTH*k]),
    .exponent(output_tmp_div[EXPONENT_WIDTH+MANTISSA_WIDTH-1 + DATA_WIDTH*k :MANTISSA_WIDTH + DATA_WIDTH*k]),
    .div(output_tmp_div[MANTISSA_WIDTH-1+ DATA_WIDTH*k:0+ DATA_WIDTH*k]),
    .clk(clk),
    .div_done(div_done),
    .div_reset(div_reset),
    .div_start(div_start)
    );
    end
endgenerate

// Accumulation ends after 4 clkCounters
// Sequence shown in more simple way in test cases talbe in Softmax_tb
// 1st using 5 adders 
//2nd using 2 adders
// 3rd using 1 adder
// final accumilation from 1 adder also
reg [4:0]z;
always @ (posedge clk && done_exp)
begin
    if(reset_softmax ==0)
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
                        end
                end
                else if(clkCounter==2)
                begin
                          adder_input_one[DATA_WIDTH-1:0]= output_tmp_add[DATA_WIDTH-1:0];  
                          adder_input_two[DATA_WIDTH-1:0]= output_tmp_add[(DATA_WIDTH*2)-1:DATA_WIDTH];    
                end
                else if(clkCounter==3)
                begin
                         adder_input_one[DATA_WIDTH-1:0]= output_tmp_add[DATA_WIDTH-1:0];  
                         adder_input_two[DATA_WIDTH-1:0]= output_tmp_add[DATA_WIDTH*5-1:DATA_WIDTH*4]; 
                end
                else if(clkCounter==4)
                begin
                   done_adders=1;
                end
                else
                begin      
                end
                clkCounter=clkCounter+1;
    end
    else
    begin
    end            
end

//Set input for dividers (each exp / sum of exp.s)
always @ (posedge clk && done_adders)
begin
  divider_input_one=output_exps;
  divider_input_two=output_tmp_add[DATA_WIDTH-1:0];
  div_start=1;
  div_reset=1;
  done_softmax=1;
 output_softmax = output_tmp_div;
end 

always @ (posedge reset_softmax)
begin
    clkCounter=0;
    adder_input_one=0;
    adder_input_two=0;
    divider_input_one=0;
    divider_input_two=0;
    div_reset=0;
    div_start=0;
    done_adders=0;
end 
endmodule