`timescale 1ns / 1ps
module LeNet(clk,reset,input_leNet,sm_output_value,sm_done,tanh6_output_value);
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
//fc
parameter FC_INPUT_SIZE1= 120; //Number of inputs
parameter FC_OUTPUT_SIZE1 = 84 ; //Number of outputs
parameter FC_INPUT_SIZE2= 84; //Number of inputs
parameter FC_OUTPUT_SIZE2 = 10; //Number of outputs
//parameter file_fc1 = "E:/VivadoFiles/finalT/weight_ones1.txt";//weights 1
//parameter file_fc2 = "E:/VivadoFiles/finalT/weight_ones2.txt";//weights 2
parameter file_fc1 = "E:/VivadoFiles/finalT/hex_weightsdense_1.txt";//weights 1
parameter file_fc2 = "E:/VivadoFiles/finalT/hex_weightsdense_2.txt";//weights 2
//parameter inputs_file_1 = "E:/VivadoFiles/finalT/Inputs_FC_1.txt";
//parameter inputs_file_2 = "E:/VivadoFiles/finalT/Inputs_FC_2.txt";
//parameter inputs_file_3 = "E:/VivadoFiles/finalT/Inputs_FC_3.txt";

//PC_MF 
parameter N = 32; //The size of the image NxN
parameter filters_number = 2; //Number of filters

parameter N3 = 5; //The size of the image NxN
parameter number_of_filters3 = 120; //Number of filters 
//avg layer
parameter dimension = 4 ;
parameter dimension2 = (dimension/2)  ;
parameter filter =3;
//softMax
parameter numberOfExps=10;

//LeNet
input clk;
input reset;
input [(DATA_WIDTH*FC_INPUT_SIZE1)-1:0] input_leNet;
reg [6*25*DATA_WIDTH-1:0]filters1; //input
//input filters2;
//input filters3;

//fc
reg  [DATA_WIDTH*FC_INPUT_SIZE1-1:0] input_fc1;
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
// reg [25*filters_number*DATA_WIDTH-1:0] PC_filters;
// reg PC_reset;
// wire [(N-4)*(N-4)*filters_number*DATA_WIDTH-1:0] PC_output_fmap;
// wire  PC_done;

reg [N*N*DATA_WIDTH-1:0] PC3_image; //The part of the image used in conv unit
reg [number_of_filters3*25*DATA_WIDTH-1:0] PC3_filters; //The filters used in conv unit
reg PC3_reset;
wire [(N3-4)*(N3-4)*number_of_filters3*DATA_WIDTH-1:0] PC3_output_fmap;
wire  PC3_done;

//tanh
//reg tanh1_reset;
//reg [(DATA_WIDTH*numberOfInputs1)-1:0] tanh1_input_value;
//wire [(DATA_WIDTH*numberOfInputs1)-1:0] tanh1_output_value;
//reg tanh2_reset;
//reg [(DATA_WIDTH*numberOfInputs2)-1:0] tanh2_input_value;
//wire [(DATA_WIDTH*numberOfInputs2)-1:0] tanh2_output_value;
//reg tanh3_reset;
//reg [(DATA_WIDTH*numberOfInputs3)-1:0] tanh3_input_value;
//wire [(DATA_WIDTH*numberOfInputs3)-1:0] tanh3_output_value;
//reg tanh4_reset;
//reg [(DATA_WIDTH*numberOfInputs4)-1:0] tanh4_input_value;
//wire [(DATA_WIDTH*numberOfInputs)-1:0] tanh4_output_value;
reg tanh5_reset;
reg [(DATA_WIDTH*FC_INPUT_SIZE1)-1:0] tanh5_input_value;
wire [(DATA_WIDTH*FC_INPUT_SIZE1)-1:0] tanh5_output_value;
reg tanh6_reset;
reg [(DATA_WIDTH*FC_INPUT_SIZE2)-1:0] tanh6_input_value;
output [(DATA_WIDTH*FC_INPUT_SIZE2)-1:0] tanh6_output_value;
//avg layer
reg avLayer_reset;
reg [(filter*dimension*dimension*DATA_WIDTH)-1:0] avLayer_input_value;
wire [(filter*dimension2*dimension2*DATA_WIDTH)-1:0] avLayer_output_value;

//softmax
reg [(DATA_WIDTH*numberOfExps)-1:0] sm_input_value;
reg sm_reset;
output [(numberOfExps*DATA_WIDTH)-1:0] sm_output_value;
output sm_done;

//LeNet
reg [(N-4)*(N-4)*6*DATA_WIDTH-1:0] output_conv1;

reg [12:0] conv3_idx; //needs to reach (25 clks if parallel or 3K if series) to fisnish

reg [7:0] fc1_idx; //needs to reach input size = (120) to finish
reg [7:0] fc2_idx;

reg [5:0] tanh1_idx; //needs 8 clks to finish
reg [5:0] tanh2_idx;
reg [5:0] tanh3_idx;
reg [5:0] tanh4_idx;
reg [5:0] tanh5_idx;
reg [5:0] tanh6_idx;

reg [2:0] sm_idx;
reg [5:0] i;
reg [5:0] j;
reg [8:0] clk_fc;
always@(posedge clk) begin
    if(reset==1) begin //resetting/initializing
        i = 10; //should be i=0 but for now we will start with the fc layer
        //j = 6; //max number of filters
        PC3_filters = 0;
        PC3_reset = 1;
        output_conv1 = 0;
        
        //tanh
        tanh5_reset=0;
        tanh6_reset=0;

        //fc
        reset_fc1=1;
        start_fc1=1;
        //temp
        tanh5_input_value=input_leNet;
        //pipeline
        conv3_idx=0;

        tanh5_idx=6'b111111; //prevent them form starting at reset
        fc1_idx=8'b1111_1111;       
        fc2_idx=8'b1111_1111;       
        tanh6_idx=6'b111111;        
        sm_idx=3'b111;             
        //$stop;
    end else begin
        
        //Conv Layer 3 
        if(conv3_idx==0)begin
            PC3_reset=1;
            conv3_idx=conv3_idx+1;
        end else if (conv3_idx==FC_INPUT_SIZE1+1 && tanh6_idx > 8) begin //Input_SIZE clks passed && next module is ready-> init the next module 
            conv3_idx=conv3_idx+1;

            //prepare next module (tanh)
            tanh6_input_value=output_fc1;
            tanh6_idx=0;
        end else if(conv3_idx<=(N3-4)*(N3-4)*filters_number)begin
            PC3_reset=0;
            conv3_idx=conv3_idx+1;
        end

        //Tanh fc 5
        if(tanh5_idx==0)begin
            tanh5_reset = 1;
            tanh5_idx=tanh5_idx+1; //wait for tanh
        end else if (tanh5_idx==9 && fc1_idx>FC_INPUT_SIZE1+1)begin //if this module finished and the next one is ready 
            tanh5_idx=tanh5_idx+1; //wait for previous module to restart this one (no "if"s will work)
            //prepare next module (fc 21
            input_fc1=tanh5_output_value;
            fc1_idx=0; //start fc1

            tanh5_idx=0; //reset myself since I am the first
            i=i+1; //take another input since I am the first
        end else if (tanh5_idx<9) begin
            tanh5_reset = 0;
            tanh5_idx=tanh5_idx+1; //wait for tanh
        end

        //Fc Layer 1 
        if(fc1_idx==0)begin
            reset_fc1=1;
            start_fc1=1;  
            fc1_idx=fc1_idx+1;
        end else if (fc1_idx==FC_INPUT_SIZE1+1 && tanh6_idx > 8) begin //Input_SIZE clks passed && next module is ready-> init the next module 
            fc1_idx=fc1_idx+1;

            //prepare next module (tanh)
            tanh6_input_value=output_fc1;
            tanh6_idx=0;
        end else if(fc1_idx<=FC_INPUT_SIZE1)begin
            reset_fc1=0;
            start_fc1=0;
            fc1_idx=fc1_idx+1;
        end

        //Tanh fc 6
        if(tanh6_idx==0)begin
            tanh6_reset = 1;
            tanh6_idx=tanh6_idx+1; //wait for tanh
        end else if (tanh6_idx==9 && fc2_idx>FC_INPUT_SIZE2+1)begin //if this module finished and the next one is ready 
            tanh6_idx=tanh6_idx+1; //wait for previous module to restart this one (no "if"s will work)
            //prepare next module (fc 2)
            input_fc2=tanh6_output_value;
            fc2_idx=0; //start fc2
        end else if (tanh6_idx<9) begin
            tanh6_reset = 0;
            tanh6_idx=tanh6_idx+1; //wait for tanh
        end

        //Fc Layer 2
        if(fc2_idx==0)begin
            reset_fc2=1;
            start_fc2=1;
            fc2_idx=fc2_idx+1;
        end else if (fc2_idx==FC_INPUT_SIZE2+1 && (sm_done||sm_idx>1)) begin //Input_SIZE clks passed  && next module ready -> init the next module  
            fc2_idx=fc2_idx+1; //wait for previous module to restart this one (no "if"s will work)

            //prepare the next module (softmax)
            sm_idx=0;
            //sm_reset=0;
            sm_input_value=output_fc2;
        end else if(fc2_idx<=FC_INPUT_SIZE2)begin
            reset_fc2=0;
            start_fc2=0;
            fc2_idx=fc2_idx+1;
        end

        //Softmax 
        if(sm_idx==0)begin
            sm_idx=1;
            sm_reset=1;
        end else
            sm_reset=0;
        //when done "sm_done" will be 1
    end
    /*
    if(reset==1) begin //resetting/initializing
            i = 10; //should be i=0 but for now we will start with the fc layer
            j = 6; //max number of filters
            PC_filters = 0;
            PC_reset = 1;
            output_conv1 = 0;
            //fc
            reset_fc1=1;
            start_fc1=1;   
            //$stop;
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
    end*/
end


//modules
SingleLayer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INPUT_SIZE(FC_INPUT_SIZE1), 
.file(file_fc1), .OUTPUT_SIZE(FC_OUTPUT_SIZE1)) //instantiate the module                                                     
SL1( .input_fc(input_fc1),
    .clk(clk),
    .start_fc(start_fc1),
    .reset(reset_fc1),
    .output_fc(output_fc1),
    .test_multi(test_multi1),.test_weights(test_weights1),.test_output(test_output1));
    
SingleLayer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INPUT_SIZE(FC_INPUT_SIZE2), 
.file(file_fc2), .OUTPUT_SIZE(FC_OUTPUT_SIZE2)) //instantiate the module                                                     
SL2( .input_fc(input_fc2),
    .clk(clk),
    .start_fc(start_fc2),
    .reset(reset_fc2),
    .output_fc(output_fc2),
    .test_multi(test_multi2),.test_weights(test_weights2),.test_output(test_output2));


PC_MF #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.N(N3),.filters_number(number_of_filters3))
PC_MF3(.image(PC_image),
.filters(PC3_filters),
.reset(PC3_reset),
.clk(clk),
.output_fmap(PC3_output_fmap),
.done(PC3_done)
);


tanh_activation_function #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .numberOfInputs(FC_INPUT_SIZE1)) 
tanh5 (
.input_tanh_function(tanh5_input_value),
.clk(clk),
.reset(tanh5_reset),
.output_tanh_function(tanh5_output_value)
);

tanh_activation_function #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .numberOfInputs(FC_INPUT_SIZE2)) 
tanh6 (
.input_tanh_function(tanh6_input_value),
.clk(clk),
.reset(tanh6_reset),
.output_tanh_function(tanh6_output_value)
);

Softmax #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) softmax1(
.input_exps(sm_input_value),
.clk(clk),
.reset_softmax(sm_reset),
.output_softmax(sm_output_value),
.done_softmax(sm_done)
);

/*avg_pooling_input_tensor #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .dimension(dimension),
.DATA_WIDTH(DATA_WIDTH),.filter(filter)) avg1 (
.imgs_in(avLayer_input_value),
.reset_module(avLayer_reset),
.clk(clk),
.imgs_out(avLayer_output_value)
);*/
endmodule
