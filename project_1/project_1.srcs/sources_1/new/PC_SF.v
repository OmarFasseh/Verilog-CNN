`timescale 1ns / 1ps
module PC_SF(image,
filter,
reset,
clk,
output_fmap,
done
);
//Parameters
//Data width parameters to allow to revert to half precision if needed
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
//The size of the image NxN
parameter N = 32;

//Inputs and outputs
input [N*N*DATA_WIDTH-1:0] image;
input [25*DATA_WIDTH-1:0] filter;
input reset;
input clk;
output  [(N-4)*DATA_WIDTH-1:0] output_fmap;
output  done;

//Registers and wires
reg [25*(N-4)*(N-4)*DATA_WIDTH-1:0] image_ordered; //The input image ordered for the convolution layer
reg conv_reset; //The register to reset the convolution units

integer j,k; //For looping integer

//At reset, order the input to get to the convolution units.
always @(reset) begin
    if(reset==1) begin
    for(j = 0, k = 0; j < (N-4)*(N-4); j = j+1, k = k + 5) begin
        image_ordered[5*DATA_WIDTH*(k+1)-1-:5*DATA_WIDTH-1] = image[(5+j)*DATA_WIDTH-1-:(5*DATA_WIDTH-1)]; //First row from right
        image_ordered[5*DATA_WIDTH*(k+2)-1-:5*DATA_WIDTH-1] = image[(5+j+N)*DATA_WIDTH-1-:(5*DATA_WIDTH-1)]; //Second row from right
        image_ordered[5*DATA_WIDTH*(k+3)-1-:5*DATA_WIDTH-1] = image[(5+j+2*N)*DATA_WIDTH-1-:(5*DATA_WIDTH-1)]; //Third row from right
        image_ordered[5*DATA_WIDTH*(k+4)-1-:5*DATA_WIDTH-1] = image[(5+j+3*N)*DATA_WIDTH-1-:(5*DATA_WIDTH-1)]; //Fourth row from right
        image_ordered[5*DATA_WIDTH*(k+5)-1-:5*DATA_WIDTH-1] = image[(5+j+4*N)*DATA_WIDTH-1-:(5*DATA_WIDTH-1)]; //Fifth row from right
    end   
    conv_reset = 1;
    end
end

//Generating the Convolution basic proccessing units
genvar i;
generate
    for(i = 0; i < N-4; i = i + 1)
    begin: Conv_PUs
    Conv_PU #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH))
    CPUs (
        .img_part(image_ordered[(i*DATA_WIDTH+DATA_WIDTH)*25-1:i*DATA_WIDTH*25]),
        .filter(filter),
        .reset(conv_reset),
        .clk(clk),
        .sum(output_fmap[i*DATA_WIDTH+DATA_WIDTH-1:i*DATA_WIDTH]),
        .done(done)
    );
    end
endgenerate


endmodule
