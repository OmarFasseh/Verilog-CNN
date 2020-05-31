`timescale 1ns / 1ps
module LeNet(clk,reset,input_fc1);
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
//fc
parameter FC_INPUT_SIZE1= 120; //Number of inputs
parameter FC_OUTPUT_SIZE1 = 84 ; //Number of outputs
parameter FC_INPUT_SIZE2= 84; //Number of inputs
parameter FC_OUTPUT_SIZE2 = 10; //Number of outputs
parameter file_fc1 = "E:/VivadoFiles/finalT/hex_weightsdense_1.txt";//weights 1
parameter file_fc2 = "E:/VivadoFiles/finalT/hex_weightsdense_2.txt";//weights 2
//parameter inputs_file_1 = "E:/VivadoFiles/finalT/Inputs_FC_1.txt";
//parameter inputs_file_2 = "E:/VivadoFiles/finalT/Inputs_FC_2.txt";
//parameter inputs_file_3 = "E:/VivadoFiles/finalT/Inputs_FC_3.txt";

//PC_MF 
parameter N = 32; //The size of the image NxN
parameter filters_number = 2; //Number of filters
//tanh
parameter numberOfInputs=84; 
//avg layer
parameter dimension = 4 ;
parameter dimension2 = (dimension/2)  ;
//softMax
parameter numberOfExps=10;

//LeNet

input clk;
input reset;
reg [6*25*DATA_WIDTH-1:0]filters1; //input
//input filters2;
//input filters3;

//input [N*N*DATA_WIDTH-1:0] PC_image;
//fc
input  [DATA_WIDTH*FC_INPUT_SIZE1-1:0] input_fc1;
reg  start_fc1,reset_fc1;
wire [DATA_WIDTH*FC_OUTPUT_SIZE1-1:0] output_fc1;
wire [(DATA_WIDTH*FC_OUTPUT_SIZE1)-1:0] test_multi1;
wire [(DATA_WIDTH*FC_OUTPUT_SIZE1)-1:0] test_weights1;
wire [(DATA_WIDTH*FC_OUTPUT_SIZE1)-1:0] test_output1;

reg  [DATA_WIDTH*FC_INPUT_SIZE2-1:0] input_fc2;
reg  start_fc2,reset_fc2;
wire [DATA_WIDTH*FC_OUTPUT_SIZE2-1:0] output_fc2;
wire [(DATA_WIDTH*FC_OUTPUT_SIZE2)-1:0] test_multi2;
wire [(DATA_WIDTH*FC_OUTPUT_SIZE2)-1:0] test_weights2;
wire [(DATA_WIDTH*FC_OUTPUT_SIZE2)-1:0] test_output2;
//PC_MF 
reg [25*filters_number*DATA_WIDTH-1:0] PC_filters;
reg PC_reset;
wire [(N-4)*(N-4)*filters_number*DATA_WIDTH-1:0] PC_output_fmap;
wire  PC_done;

//tanh
reg [(DATA_WIDTH*numberOfInputs)-1:0] tanh_input_value;
wire [(DATA_WIDTH*numberOfInputs)-1:0] tanh_output_value;

//avg layer
reg [(dimension*dimension*DATA_WIDTH)-1:0] avLayer_input_value;
wire [(dimension2*dimension2*DATA_WIDTH)-1:0] avLayer_output_value;

//softmax
reg [(DATA_WIDTH*numberOfExps)-1:0] sm_input_value;
wire [(numberOfExps*DATA_WIDTH)-1:0] sm_output_value;
wire sm_done;

//LeNet
reg [(N-4)*(N-4)*6*DATA_WIDTH-1:0] output_conv1;
reg [5:0] i;
reg [5:0] j;
reg [8:0] clk_fc;
always@(posedge clk) begin
    if(reset==1) begin //resetting/initializing
        i = 10; //should be i=0 but for now we will start with the fc layer
        j = 6; //max number of filters
        PC_filters = 0;
        PC_reset = 1;
        output_conv1 = 0;
        //fc
        reset_fc1=1;
        start_fc1=1;   
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
        reset_fc1=1;
        start_fc1=1;  
        i=i+1;
        //input_fc1[DATA_WIDTH*FC_INPUT_SIZE-1:0]=
        clk_fc=0;
    end else if(i==11)begin
        if (clk_fc >= FC_INPUT_SIZE1)
            i=i+1;
        else begin
            reset_fc1=0;
            start_fc1=0;
            clk_fc = clk_fc+1;
        end
    end else if(i==12) begin
        //reset tanh
        tanh_input_value=output_fc1;
        j=7;//8-1
    end else if(i==13)begin
        if(j!=0)begin
            j=j-1;
        end else begin
            i=i+1;
            clk_fc=0;
            reset_fc2=1;
            start_fc2=1;
            input_fc2=tanh_output_value;
        end
    end else if(i==14)begin
        if (clk_fc >= FC_INPUT_SIZE2)
            i=i+1;
        else begin
            reset_fc2=0;
            start_fc2=0;
            clk_fc = clk_fc+1;
        end
    end else if(i==15)begin
        
    end
end


//modules
SingleLayer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INPUT_SIZE(FC_INPUT_SIZE1), 
.file(file_fc1), .OUTPUT_SIZE(FC_OUTPUT_SIZE1))//instantiate the module                                                     
SL1( .input_fc(input_fc1),
    .clk(clk),
    .start_fc(start_fc1),
    .reset(reset_fc1),
    .output_fc_final(output_fc1),
    .test_multi(test_multi1),.test_weights(test_weights1),.test_output(test_output1));
    
SingleLayer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INPUT_SIZE(FC_INPUT_SIZE2), 
    .file(file_fc2), .OUTPUT_SIZE(FC_OUTPUT_SIZE2))//instantiate the module                                                     
    SL2( .input_fc(input_fc2),
        .clk(clk),
        .start_fc(start_fc2),
        .reset(reset_fc2),
        .output_fc_final(output_fc2),
        .test_multi(test_multi2),.test_weights(test_weights2),.test_output(test_output2));

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
