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
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
//The size of the image NxN
parameter N = 32;
//Number of single filter module; i.e. which filter it is calculating in parallel filters module
parameter filter_number = 1;

//Inputs and outputs
input [N*N*DATA_WIDTH-1:0] image;
input [25*DATA_WIDTH-1:0] filter;
input reset;
input clk;
output reg [(N-4)*(N-4)*DATA_WIDTH-1:0] output_fmap;
output reg  done;

//Registers and wires
reg [25*DATA_WIDTH-1:0] image_ordered; //The input image ordered for the convolution layer
wire [DATA_WIDTH-1:0] tmp_output; //The output of 1 pixel
reg conv_reset; //The register to reset the convolution units
wire conv_done; //Done signal from the convolution unit
integer finished_pixels; //The number of finished pixels of output.
integer counter; //Counter for every row
integer input_index; //Index for the input of convolution
reg [3:0] j; //For looping integer

//At reset, order the input to enter to the convolution units.
always @(posedge clk) begin
    if(reset==1) begin
        j = 2;
        conv_reset = 1;
        finished_pixels = 0;
        counter = 0;
        input_index = 0;
        done = 0;
        image_ordered[5*DATA_WIDTH*(1)-1-:5*DATA_WIDTH] = image[(5)*DATA_WIDTH-1-:(5*DATA_WIDTH)]; //First row from right
    end else
        conv_reset = 0;
end

//When the convolution unit finishes calculating part of the image, increment the finished pixels to get next set of input
always @(negedge clk) begin
    if(conv_done) begin
        if(tmp_output != 0)
            counter = counter;    
        if(finished_pixels == 493)    
            counter = counter;
        output_fmap[(finished_pixels+1)*DATA_WIDTH-1-:DATA_WIDTH] = tmp_output; //Copy output
        counter = counter + 1; //Increment the counter
        finished_pixels = 1 + finished_pixels; //Increment finished pixels
        input_index = input_index + 1; //Increment the input index
        if(counter == N-4) begin //If we finished the input of this row
            counter = 0; //Reset the counter
            input_index = input_index + 4; //Go to the next row of inputs
        end 
        j = 2;
        if(finished_pixels == (N-4)*(N-4)) begin //If we calculated all output pixels
            done = 1;
        end else begin
            image_ordered[5*DATA_WIDTH*(1)-1-:5*DATA_WIDTH] = image[(5+input_index)*DATA_WIDTH-1-:(5*DATA_WIDTH)]; //First row from right
            conv_reset = 1; //If not done yet, reset the convolution units to start calculating next set of outputs.
        end
    end
    image_ordered[5*DATA_WIDTH*(j)-1-:5*DATA_WIDTH] = image[(5+input_index+(j-1)*N)*DATA_WIDTH-1-:(5*DATA_WIDTH)]; //Copy rows from right in clocks instead
    //of calculating in a loop to minimize hardware.
    j = j + 1;
    if(j == 6)
        j = 1;
end

//Generating the Convolution basic proccessing unit
Conv_PU #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH))
CPUs (
.image(image_ordered[DATA_WIDTH*25-1-:DATA_WIDTH*25]),
.filter(filter),
.reset(conv_reset),
.clk(clk),
.sum(tmp_output),
.done(conv_done)
);



endmodule