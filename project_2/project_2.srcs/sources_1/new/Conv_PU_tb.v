`timescale 1ns / 1ps
module Conv_PU_tb;

parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
parameter NUM_TEST_CASES = 8;
parameter image_file = "C:/Users/giga/Documents/imgs.txt";
parameter filter_file = "C:/Users/giga/Documents/filters.txt";
//Inputs and output registers and wires
//Inputs to Conv_PU
reg clk;
reg reset;
reg [25*DATA_WIDTH-1:0] image; //The part of the image used in conv unit
reg [25*DATA_WIDTH-1:0] filter; //The part of filter used in conv unit
reg [11:0] start_index; //The start index of the image part to be convoluted
reg [25*DATA_WIDTH-1:0] images [0:NUM_TEST_CASES-1]; //A collection of parts, different test cases
reg [25*DATA_WIDTH-1:0] filters [0:NUM_TEST_CASES-1]; //For different test cases
//Outputs from Conv_PU
wire done;
wire [DATA_WIDTH-1:0] sum;

integer i; //Integer that determines which test case we're now in.

initial begin 
    //Set the clock to 0
    clk = 0;
    start_index = 0;
    $readmemh(filter_file, filters);
    $readmemh(image_file, images);
    //Iterate over the test by the number of test cases
    for(i = 0; i < NUM_TEST_CASES; i = i + 1) begin
        //Load the test part of image and filter
        image[25*(DATA_WIDTH)-1-:25*DATA_WIDTH] = images[i];
        filter[25*(DATA_WIDTH)-1-:25*DATA_WIDTH] = filters[i];
        //Reset the conv unit
        reset = 1;
        #1 //Wait for conv unit to feel the reset
        reset = 0;
        #30; //clocks to work
    end
    $stop;
end
//Toggle the clock every 1 second
always begin 
    #0.5 clk = ~clk;
end

//instantiate the module
Conv_PU #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH))                                                      
CPU(
    .image(image),
    .filter(filter),
    .sum(sum),
    .done(done),
    .reset(reset),
    .clk(clk)
);
endmodule
