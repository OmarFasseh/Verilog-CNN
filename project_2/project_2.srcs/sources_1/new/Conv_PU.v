`timescale 1ns / 1ps
module Conv_PU(
image,
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
input [25*DATA_WIDTH-1:0] image;
input [25*DATA_WIDTH-1:0] filter;
input reset;
input clk;
output reg [DATA_WIDTH-1:0] sum;
output reg done;

//Registers and wires
reg [5:0] state; //The state of the processing units, which pixels are multiplied and which are not (maximum is 25)
wire [DATA_WIDTH-1:0] temp_sum; //The temp that we accumulate in.

always @(negedge clk) begin
    if(reset == 0) begin //If resetting
        state = state;
    end else begin
        state = 1;
        done = 0;    
    end
end

//At new clock edge, we get the next pixel to multiply it
always @(posedge clk) begin
    if(state == 26) begin //If 25 cycles is done; we finished multiplying and accumulating
        done = 1;
        sum = temp_sum;
        state = 0;
    end else
        state = state + 1; //Increment the state
end

//Generating PE
PE_FC_ANN #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) 
PEs (
.input_fc(image[state*DATA_WIDTH-1-:DATA_WIDTH]),
.iweight_FC (filter[state*DATA_WIDTH-1-:DATA_WIDTH]),
.clk(clk),
.start_FC(reset),
.output_fc(temp_sum)
);
endmodule
