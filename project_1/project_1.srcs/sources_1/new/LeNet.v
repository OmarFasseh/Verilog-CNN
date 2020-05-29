`timescale 1ns / 1ps
module LeNet();
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
reg clk;
//PC_MF 
parameter N = 32; //The size of the image NxN
parameter filters_number = 2; //Number of filters
reg [N*N*DATA_WIDTH-1:0] PC_image;
reg [25*filters_number*DATA_WIDTH-1:0] PC_filters;
reg PC_reset;
wire [(N-4)*(N-4)*filters_number*DATA_WIDTH-1:0] PC_output_fmap;
wire  PC_done;
//tanh
parameter numberOfInputs=6; 
reg [((EXPONENT_WIDTH+MANTISSA_WIDTH+1)*numberOfInputs)-1:0] tanh_input_value;
wire [((EXPONENT_WIDTH+MANTISSA_WIDTH+1)*numberOfInputs)-1:0] tanh_output_value;
//avg layer
parameter dimension = 4 ;
parameter dimension2 = (dimension/2)  ;
reg [(dimension*dimension*DATA_WIDTH)-1:0] avLayer_input_value;
wire [(dimension2*dimension2*DATA_WIDTH)-1:0] avLayer_output_value;
//softmax
parameter numberOfExps=10; 
reg [(DATA_WIDTH*numberOfExps)-1:0] sm_input_value;
wire [(numberOfExps*DATA_WIDTH)-1:0] sm_output_value;
wire sm_done;

PC_MF #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .numberOfInputs(numberOfInputs),.N(N),.filters_number(filters_number))
PC_MF1(.image(PC_image),
.filters(PC_filters),
.reset(PC_reset),
.clk(clk),
.output_fmap(PC_output_fmap),
.done(PC_done)
);

tanh_activation_function #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .numberOfInputs(numberOfInputs)) 
tanh1 (
.input_tanh_function(tanh_input_value),
.clk(clk),
.output_tanh_function(tanh_output_value)
);

Softmax #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) 
softmax1 (
.input_exps(sm_input_value),
.clk(clk),
.output_softmax(sm_output_value),
.done_softmax(sm_done)
);

avg_layer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .dimension(dimension),
 .DATA_WIDTH(DATA_WIDTH)) 
avg1 (
.img_in(avLayer_input_value),
.clk(clk),
.img_out(avLayer_output_value)
);

endmodule
