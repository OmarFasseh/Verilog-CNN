`timescale 1ns / 1ps
module PC_MF(image,
filters,
reset,
clk,
output_fmap,
done
);
//Parameters
//Data width parameters to allow to revert to half precision if needed
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
//The size of the image NxN
parameter N = 32;
//Number of filters to be multiplied in parallel
parameter filters_number = 6;

//Inputs and outputs
input [N*N*DATA_WIDTH-1:0] image;
input [25*filters_number*DATA_WIDTH-1:0] filters;
input reset;
input clk;
output [(N-4)*(N-4)*filters_number*DATA_WIDTH-1:0] output_fmap;
output reg  done;

//Registers and wires
reg filter_reset; //The register to reset the image convolution units
wire filter_done; //Done signal from the image convolution unit
integer finished_filters; //The number of finished filters of output.

//At reset, order the input to enter to the image convolution units.
always @(posedge clk) begin
    if(reset==1) begin
        finished_filters = 0;
        done = 0;
        filter_reset = 1;
    end else
        filter_reset = 0;
end

//When the convolution unit finishes calculating feature map of the image, increment the finished filters
always @(negedge clk) begin
    if(filter_done) begin
        finished_filters = 1 + finished_filters; //Increment finished pixels 
        if(finished_filters == filters_number) begin //If we calculated all output feature maps
            done = 1;
        end else begin
            finished_filters = finished_filters;
        end
    end
end

//Generating the parallel PC_SF
genvar i;
generate
    for(i = 1; i <= filters_number; i = i + 1) begin
        PC_SF #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .N(N), .filter_number(i))
        PCs(
        .image(image),
        .filter(filters[25*(i)*DATA_WIDTH-1-:25*DATA_WIDTH]),
        .reset(filter_reset),
        .clk(clk),
        .output_fmap(output_fmap[i*(N-4)*(N-4)*DATA_WIDTH-1-:(N-4)*(N-4)*DATA_WIDTH]),
        .done(filter_done)
        );
    end
endgenerate


endmodule