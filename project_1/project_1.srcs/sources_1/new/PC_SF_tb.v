`timescale 1ns / 1ps
module PC_SF_tb;

parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
parameter NUM_TEST_CASES = 1;
parameter N = 8; //Size of the image NXN
parameter image_file = "C:/Users/giga/Documents/imgs3.txt";
parameter filter_file = "C:/Users/giga/Documents/filters3.txt";

//Inputs and output registers and wires
//Inputs to PC_SF
reg clk;
reg reset;
reg [N*N*DATA_WIDTH-1:0] image; //The part of the image used in conv unit
reg [25*DATA_WIDTH-1:0] filter; //The part of filter used in conv unit
reg [N*N*DATA_WIDTH-1:0] images [0:NUM_TEST_CASES-1]; //A collection of images for different test cases
reg [25*DATA_WIDTH-1:0] filters [0:NUM_TEST_CASES-1]; //For different test cases
//Outputs from PC_SF
wire done;
wire [(N-4)*(N-4)*DATA_WIDTH-1:0] output_fmap;

integer i; //Integer to determine which test case we're in

initial begin

    clk = 0;
    $readmemh(filter_file, filters);
    $readmemh(image_file, images);
    //Iterate over the test by the number of test cases
    for(i = 0; i < NUM_TEST_CASES; i = i + 1) begin
        //Load the test part of image and filter
        image[N*N*(DATA_WIDTH)-1-:N*N*DATA_WIDTH] = images[i];
        filter[N*N*(DATA_WIDTH)-1-:N*N*DATA_WIDTH] = filters[i];
        //Reset the conv unit
        reset = 1;
        #1 //Wait for conv unit to feel the reset
        reset = 0;
        #500; //clocks to work
    end
    $stop;
end

//Toggle the clock every 1 second
always begin
    #0.5 clk = ~clk;
end

//Generating the Convolution layer proccessing unit
PC_SF #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .N(N)) 
ConvLayer(.image(image),
.filter(filter),
.reset(reset),
.clk(clk),
.output_fmap(output_fmap),
.done(done)
);

endmodule
