`timescale 1ns / 1ps
module PC_MF_tb;

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
parameter NUM_TEST_CASES = 1;
parameter N = 32; //Size of the image NXN
parameter number_of_filters = 6; 
parameter image_file = "C:/Users/giga/Documents/image1.txt";
parameter filter_file = "C:/Users/giga/Documents/filters_layer1.txt";

//Inputs and output registers and wires
//Inputs to PC_SF
reg clk;
reg reset;
reg [N*N*DATA_WIDTH-1:0] image; //The part of the image used in conv unit
reg [number_of_filters*25*DATA_WIDTH-1:0] filters; //The filters used in conv unit
reg [N*N*DATA_WIDTH-1:0] images [0:NUM_TEST_CASES-1]; //A collection of images for different test cases
reg [number_of_filters*25*DATA_WIDTH-1:0] filters_mem [0:NUM_TEST_CASES-1]; //For different test cases
//Outputs from PC_SF
wire done;
wire [(N-4)*(N-4)*number_of_filters*DATA_WIDTH-1:0] output_fmap;

integer i; //Integer to determine which test case we're in

initial begin

    clk = 0;
    $readmemh(filter_file, filters_mem);
    $readmemh(image_file, images);
    //Iterate over the test by the number of test cases
    for(i = 0; i < NUM_TEST_CASES; i = i + 1) begin
        //Load the test image and filters
        image[N*N*(DATA_WIDTH)-1-:N*N*DATA_WIDTH] = images[i];
        filters[number_of_filters*25*(DATA_WIDTH)-1-:25*DATA_WIDTH*number_of_filters] = filters_mem[i];
        //Reset the conv unit
        reset = 1;
        #1 //Wait for conv unit to feel the reset
        reset = 0;
        #(number_of_filters*21000); //clocks to work
    end
    $stop;
end

//Toggle the clock every 1 second
always begin
    #0.5 clk = ~clk;
end

//Generating the Convolution layer proccessing unit
PC_MF #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .filters_number(number_of_filters), .N(N)) 
MultFiltersConv(.image(image),
.filters(filters),
.reset(reset),
.clk(clk),
.output_fmap(output_fmap),
.done(done)
);

endmodule
