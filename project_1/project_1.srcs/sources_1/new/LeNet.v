`timescale 1ns / 1ps
module LeNet(clk,reset,PC_image,filters1,filters2,filters3);
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
input clk;
input reset;
input [6*25*DATA_WIDTH-1:0]filters1;
input filters2;
input filters3;

input [N*N*DATA_WIDTH-1:0] PC_image;
//fc
parameter FC_INPUT_SIZE= 120; //Number of inputs
parameter FC_OUTPUT_SIZE = 84 ; //Number of outputs
parameter file = "E:/VivadoFiles/finalT/weights1_modified.txt";
parameter inputs_file_1 = "E:/VivadoFiles/finalT/Inputs_FC_1.txt";
parameter inputs_file_2 = "E:/VivadoFiles/finalT/Inputs_FC_2.txt";
parameter inputs_file_3 = "E:/VivadoFiles/finalT/Inputs_FC_3.txt";
reg  [DATA_WIDTH*FC_INPUT_SIZE-1:0] input_fc1;
reg  start_fc,done;
wire [DATA_WIDTH*FC_OUTPUT_SIZE-1:0] output_fc_final;
wire [(DATA_WIDTH*FC_OUTPUT_SIZE)-1:0] test_multi;
wire [(DATA_WIDTH*FC_OUTPUT_SIZE)-1:0] test_weights;
wire [(DATA_WIDTH*FC_OUTPUT_SIZE)-1:0] test_output;

//PC_MF 
parameter N = 32; //The size of the image NxN
parameter filters_number = 2; //Number of filters
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

//LeNet
reg [(N-4)*(N-4)*6*DATA_WIDTH-1:0] output_conv1;
reg [5:0] i;
reg [5:0] j;

always@(posedge clk) begin
    if(reset==1) begin //resetting/initializing
        i = 10; //should be i=0 but for now we will start with the fc layer
        j = 6; //max number of filters
        PC_filters = 0;
        PC_reset = 1; 
        output_conv1 = 0;    
    end else if (i==0)begin
        //initializing conv module
        PC_reset = 0; //close the reset
        PC_filters[25*filters_number*DATA_WIDTH-1:0] = filters1[j*25*DATA_WIDTH-1-:filters_number*25*DATA_WIDTH];
        i=i+1;
    end else if (i==1 && PC_done) begin
        //resetting and storing output from the conv
        output_conv1[(N-4)*(N-4)*j*DATA_WIDTH-1-:filters_number*(N-4)*(N-4)*DATA_WIDTH] =PC_output_fmap[(N-4)*(N-4)*filters_number*DATA_WIDTH-1:0];
        j=j-filters_number; //j starts with the max filter numbers and decreases by the "rate of filters done"
        PC_reset =1; //reset the module
        
        if(j!=0)
            i=i-1; //go to the previous step
        else    //finished -> j==0 
            i=i+1; //go to the next step
    end else if(i==2) begin 
        //delayed for now we start at i =10
    end else if(i==10)begin
        
    end
end


//modules
SingleLayer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INPUT_SIZE(FC_INPUT_SIZE), 
.file(file), .OUTPUT_SIZE(FC_OUTPUT_SIZE))//instantiate the module                                                     
SL( .input_fc(input_fc1),
    .clk(clk),
    .start_fc(start_fc),
    .reset(reset),
    .output_fc_final(output_fc_final),
    .test_multi(test_multi),.test_weights(test_weights),.test_output(test_output),.done(done));

PC_MF #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.DATA_WIDTH(DATA_WIDTH),.N(N),.filters_number(filters_number))
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
