`timescale 1ns / 1ps
module Conv_PU(
img_part,
filter,
reset,
clk,
sum,
done);

//Parameters
//Data width parameters to allow to revert to half precision if needed
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;

//Inputs and outputs
input [25*DATA_WIDTH-1:0] img_part;
input [25*DATA_WIDTH-1:0] filter;
input reset;
input clk;
output reg [DATA_WIDTH-1:0] sum;
output reg done;

//Registers and wires
reg [3:0] state; //The state of the processing units
reg [13*DATA_WIDTH-1:0] mult_inp; //The first input of the multiplier, we need 13 multiplier as we multiply the 25 numbers on 2 clocks.
reg [13*DATA_WIDTH-1:0] filter_inp; //The second input of the multiplier, we need 13 multiplier as we multiply the 25 numbers on 2 clocks.
reg [7*DATA_WIDTH-1:0] add_inp; //The input of the adder, we will add 13 numbers every clock. 
reg [7*DATA_WIDTH-1:0] add_out; //The output of addition.
reg [5*DATA_WIDTH-1:0] add_left; //The numbers added that we left
wire [13*DATA_WIDTH-1:0] mult_out; //The output of multiplier, we will have 13 output per clock.
wire [7*DATA_WIDTH-1:0] add_out_tmp; //The temp register for addition used to accumulate as input reg can't be same output reg


//At start of operating on reset, we load first 13 number from image and their
//corresponding filter numbers to multiply them in first clock
always @(reset) begin
    if(reset==1) begin
        state = 0;
        mult_inp[13*DATA_WIDTH-1:0] = img_part[13*DATA_WIDTH-1:0];
        filter_inp[13*DATA_WIDTH-1:0] = filter[13*DATA_WIDTH-1:0];
        done = 0;
    end 
end

//State machine
always @(posedge clk) begin
    //Update the input to the adder with latest output to accumulate
        //Loop to put the second half of inputs in add_inp
        //i.e to add Out_1 + Out_14, Out_2 + Out_15...etc
    if(state == 2) begin
        add_out[6*DATA_WIDTH-1:0] = add_out_tmp[6*DATA_WIDTH-1:0]; //get the 6 numbers from addition
        add_inp[6*DATA_WIDTH-1:5*DATA_WIDTH] = add_out_tmp[7*DATA_WIDTH-1:6*DATA_WIDTH]; //get the last remaining number from addition
        add_inp[5*DATA_WIDTH-1:0] = add_left[5*DATA_WIDTH-1:0]; //get the 5 numbers we left last time 
        state = state + 1;
    end else if(state == 3) begin
        add_inp[3*DATA_WIDTH-1:0] = add_out_tmp[3*DATA_WIDTH-1:0]; //First input of adder
        add_out[3*DATA_WIDTH-1:0] = add_out_tmp[6*DATA_WIDTH-1:3*DATA_WIDTH]; //Second input
        state = state + 1;
    end else if(state == 4) begin
        add_inp[2*DATA_WIDTH-1:0] = add_out_tmp[2*DATA_WIDTH-1:0]; //First input of adder
        add_out[2*DATA_WIDTH-1:0] = add_out_tmp[4*DATA_WIDTH-1:2*DATA_WIDTH]; //Second input
        add_out[2*DATA_WIDTH-1:1*DATA_WIDTH] = 0; //To remove garbage values
        state = state + 1;
    end else if(state == 5) begin
        add_inp[1*DATA_WIDTH-1:0] = add_out_tmp[1*DATA_WIDTH-1:0]; //First input of adder
        add_out[1*DATA_WIDTH-1:0] = add_out_tmp[2*DATA_WIDTH-1:1*DATA_WIDTH]; //Second input
        state = state + 1;
    end else if(state == 6) begin
    sum = add_out_tmp[1*DATA_WIDTH-1:0]; //Final output
    done = 1;
    state = state + 1;
    end
end

//When multiplication is done in first or second clock
always @(mult_out) begin
    if(state == 0) begin
        //When first state is done, we load the other 12 numbers from image and filter to multiply
        //them in next clock rise.
        mult_inp[13*DATA_WIDTH-1:0] = img_part[25*DATA_WIDTH-1:13*DATA_WIDTH];
        filter_inp[13*DATA_WIDTH-1:0] = filter[25*DATA_WIDTH-1:13*DATA_WIDTH];
        //Move output from multiplication to the addition registers to add them in next negedge
        add_out[7*DATA_WIDTH-1:0] = mult_out[7*DATA_WIDTH-1:0]; //Get first 7 numbers
        add_inp[6*DATA_WIDTH-1:0] = mult_out[13*DATA_WIDTH-1:7*DATA_WIDTH]; //Get second 6 numbers
        add_inp[7*DATA_WIDTH-1:6*DATA_WIDTH] = 0; //make 7th number equal zero
        //Increment the state
        state = state + 1;
    end else if(state == 1) begin
        add_out[7*DATA_WIDTH-1:0] = mult_out[7*DATA_WIDTH-1:0]; //Get first 7 numbers
        add_inp[5*DATA_WIDTH-1:0] = mult_out[12*DATA_WIDTH-1:7*DATA_WIDTH]; //Get second 5 numbers
        add_inp[7*DATA_WIDTH-1:5*DATA_WIDTH] = add_out_tmp[2*DATA_WIDTH-1:0]; //get first 2 numbers added in last negedge
        add_left[5*DATA_WIDTH-1:0] = add_out_tmp[7*DATA_WIDTH-1:2*DATA_WIDTH]; //store the 5 numbers added that we won't take in next state
        state = state + 1;
    end
end

//Generating multiplier and adders
genvar i;
generate  //generate the parallel multipliers
	for (i=0; i < 13; i=i+1) 
	begin :mult 
	fpMul #(.DATA_WIDTH(DATA_WIDTH), .EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) 
	MULs (
	.flp_a(mult_inp[i*DATA_WIDTH+DATA_WIDTH-1:i*DATA_WIDTH]),
	.flp_b(filter_inp[i*DATA_WIDTH+DATA_WIDTH-1:i*DATA_WIDTH]),
	.clk(clk),
	.prod(mult_out[i*DATA_WIDTH+MANTISSA_WIDTH-1:i*DATA_WIDTH]),
    .sign(mult_out[i*DATA_WIDTH + DATA_WIDTH - 1]),
    .exponent(mult_out[i*DATA_WIDTH+DATA_WIDTH-2:i*DATA_WIDTH+MANTISSA_WIDTH])
	);
	end
endgenerate 
generate //Generate parallel adders
    for(i = 0; i < 7; i = i+1)
	begin : adders
	fp_add_2 #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH))
    ADDRs (
    .A_FP(add_out[i*DATA_WIDTH+DATA_WIDTH-1:i*DATA_WIDTH]),
    .B_FP(add_inp[i*DATA_WIDTH+DATA_WIDTH-1:i*DATA_WIDTH]),
    .sign(add_out_tmp[i*DATA_WIDTH + DATA_WIDTH -1]),
    .exponent(add_out_tmp[i*DATA_WIDTH+DATA_WIDTH-2:i*DATA_WIDTH+MANTISSA_WIDTH]),
    .mantissa(add_out_tmp[i*DATA_WIDTH+MANTISSA_WIDTH-1:i*DATA_WIDTH]),
    .clk(clk)
    );
	end
endgenerate 
endmodule
