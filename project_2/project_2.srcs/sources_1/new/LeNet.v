`timescale 1ns / 1ps
module LeNet(clk,reset,input_leNet,PC3_filters,sm_output_value,sm_done,tanh6_output_value);
parameter PIPELINED_INPUTS = 2;

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

//array adder
parameter ARRAY_LEN =25;
//PC_MF 
parameter N = 32; //The size of the image NxN
parameter filters_number = 2; //Number of filters

parameter N3 = 5; //The size of the image NxN of 3rd conv
parameter number_of_filters3 = 60; //Number of filters of 3rd conv
parameter number_of_series3 =2;//120/number_of_filters3 =>how many series operation needed  
//avg layer
parameter AVG_DIMENSION = 10 ;
parameter AVG_DIMENSION2 = 5  ;
parameter AVG_FILTER =16;
//softMax
parameter numberOfExps=10;

//LeNet i/o
input clk;
input reset;
input [PIPELINED_INPUTS*(AVG_FILTER*AVG_DIMENSION*AVG_DIMENSION*DATA_WIDTH)-1:0] input_leNet;

reg [6*25*DATA_WIDTH-1:0]filters1; //input
//input filters2;
//input filters3;

//fc
reg  [DATA_WIDTH*FC_INPUT_SIZE1-1:0] input_fc1;
reg  start_fc1,reset_fc1;
wire [DATA_WIDTH*FC_OUTPUT_SIZE1-1:0] output_fc1;

reg  [DATA_WIDTH*FC_INPUT_SIZE2-1:0] input_fc2;
reg  start_fc2,reset_fc2;
wire [DATA_WIDTH*FC_OUTPUT_SIZE2-1:0] output_fc2;

//Array adder
reg [(DATA_WIDTH*AVG_FILTER*AVG_DIMENSION2*AVG_DIMENSION2)-1:0] aAdder_tmp;
reg [ARRAY_LEN*DATA_WIDTH-1:0]      aAdder_in1;
reg [ARRAY_LEN*DATA_WIDTH-1:0]      aAdder_in2; 
wire [ARRAY_LEN*DATA_WIDTH-1:0] aAdder_out1 ;

//PC_MF 
// reg [25*filters_number*DATA_WIDTH-1:0] PC_filters;
// reg PC_reset;
// wire [(N-4)*(N-4)*filters_number*DATA_WIDTH-1:0] PC_output_fmap;
// wire  PC_done;

reg [N3*N3*DATA_WIDTH-1:0] PC3_image; //The part of the image used in conv unit
input [number_of_filters3*number_of_series3*25*DATA_WIDTH-1:0] PC3_filters; //The filters used in conv unit
reg [number_of_filters3*25*DATA_WIDTH-1:0] PC3_passed_filters;
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
reg tanh4_reset;
reg [(DATA_WIDTH*AVG_FILTER*AVG_DIMENSION2*AVG_DIMENSION2)-1:0] tanh4_input_value;
wire [(DATA_WIDTH*AVG_FILTER*AVG_DIMENSION2*AVG_DIMENSION2)-1:0] tanh4_output_value;
reg tanh5_reset;
reg [(DATA_WIDTH*FC_INPUT_SIZE1)-1:0] tanh5_input_value;
wire [(DATA_WIDTH*FC_INPUT_SIZE1)-1:0] tanh5_output_value;
reg tanh6_reset;
reg [(DATA_WIDTH*FC_INPUT_SIZE2)-1:0] tanh6_input_value;
output [(DATA_WIDTH*FC_INPUT_SIZE2)-1:0] tanh6_output_value;

//avg layer
reg avg_reset;
reg [(AVG_FILTER*AVG_DIMENSION*AVG_DIMENSION*DATA_WIDTH)-1:0] avg_input_value;
wire [(AVG_FILTER*AVG_DIMENSION2*AVG_DIMENSION2*DATA_WIDTH)-1:0] avg_output_value;

//softmax
reg [(DATA_WIDTH*numberOfExps)-1:0] sm_input_value;
reg sm_reset;
output [(numberOfExps*DATA_WIDTH)-1:0] sm_output_value;
output sm_done;

//LeNet
reg [(N-4)*(N-4)*6*DATA_WIDTH-1:0] output_conv1;
reg [(N3-4)*(N3-4)*number_of_filters3*number_of_series3*DATA_WIDTH-1:0]   PC3_whole_output;

reg avg_ready, conv3_ready, fc1_ready, fc2_ready, tanh4_ready, tanh5_ready, tanh6_ready, aAdder_ready;

reg [7:0] avg_idx;

reg [12:0] conv3_idx; //needs to reach (25 clks if parallel or 3K if series) to fisnish

reg [7:0] fc1_idx; //needs to reach input size = (120) to finish
reg [7:0] fc2_idx;

reg [5:0] aAdder_idx; //needs 16 clks

reg [5:0] tanh1_idx; //needs 8 clks to finish
reg [5:0] tanh2_idx;
reg [5:0] tanh3_idx;
reg [5:0] tanh4_idx;
reg [5:0] tanh5_idx;
reg [5:0] tanh6_idx;

reg [5:0] sm_idx;
reg [5:0] i;
reg [5:0] j;
reg [8:0] clk_fc;

always@(posedge clk) begin
    if(reset==1) begin //resetting/initializing
        i = 1; //pipelined inputs index
        //j = 6; //max number of filters
        PC3_reset = 1;
        output_conv1 = 0;
        
        avg_reset=0;
        //tanh
        tanh4_reset=0;
        tanh5_reset=0;
        tanh6_reset=0;

        //fc
        reset_fc1=0;
        start_fc1=0;
        reset_fc2=0;
        start_fc2=0;
        //temp
        //PC3_image=input_leNet[i*DATA_WIDTH*FC_INPUT_SIZE1+N3*N3*DATA_WIDTH-1:0];
        //~~~~~~~~~~~~~~~~pipeline~~~~~~~~~~~~~~~~//

        //mark all modules as ready to recieve from its previous module (pipeline)
        avg_ready=1;
        aAdder_ready=1;
        conv3_ready=1;
        tanh4_ready=1;
        tanh5_ready=1;
        tanh6_ready=1;
        fc1_ready=1;
        fc2_ready=1;

        avg_idx=0;
        aAdder_idx=6'b111111;
        tanh4_idx=6'b111111; //prevent them form starting at reset
        conv3_idx=12'b1111_1111_1111;
        tanh5_idx=6'b111111; //prevent them form starting at reset
        fc1_idx=8'b1111_1111;       
        fc2_idx=8'b1111_1111;       
        tanh6_idx=6'b111111;        
        sm_idx=6'b111111;            
        //$stop;
    end else begin
        
        //Avg pool 
        if(avg_idx==0)begin
            avg_ready=0;
            avg_reset = 1;
            //give myself input since I am the first module
            avg_input_value=input_leNet[i*(AVG_FILTER*AVG_DIMENSION*AVG_DIMENSION*DATA_WIDTH)-1-:(AVG_FILTER*AVG_DIMENSION*AVG_DIMENSION*DATA_WIDTH)]; 
            avg_idx=avg_idx+1; 
        end else if (avg_idx==160 && tanh4_ready)begin //if this module finished and the next one is ready 
            avg_idx=avg_idx+1; //wait for previous module to restart this one (no "if"s will work)
            //prepare next module (tanh 4)
            tanh4_input_value=avg_output_value;
            tanh4_idx=0; //start Conv 3

            if(i<PIPELINED_INPUTS) begin
                    avg_idx=0; //reset myself since I am the first module
                    i=i+1; //take another input since I am the first module
            end
            avg_ready=1;
        end else if (avg_idx<160) begin
            avg_reset = 0;
            avg_idx=avg_idx+1; 
        end

        //Tanh fc 4
        if(tanh4_idx==0)begin
            tanh4_ready=0;
            tanh4_reset = 1;
            tanh4_idx=tanh4_idx+1; 
            //$stop; //stop here to see output of previous module
        end else if (tanh4_idx==9 && aAdder_ready)begin //if this module finished and the next one is ready 
            tanh4_idx=tanh4_idx+1; //wait for previous module to restart this one (no "if"s will work)
            //prepare next module (array adder)
            aAdder_tmp=tanh4_output_value;
            aAdder_idx=0; //start array adder
            tanh4_ready=1;
        end else if (tanh4_idx<9) begin
            tanh4_reset = 0;
            tanh4_idx=tanh4_idx+1; 
        end

        //array adder
        if(aAdder_idx==0)begin
            aAdder_ready=0;
            aAdder_idx=aAdder_idx+1; 
            aAdder_in1=aAdder_tmp[(ARRAY_LEN*DATA_WIDTH)-1-:ARRAY_LEN*DATA_WIDTH];
            aAdder_in2=aAdder_tmp[(aAdder_idx+1)*ARRAY_LEN*DATA_WIDTH-1-:ARRAY_LEN*DATA_WIDTH];
            //$stop; //stop here to see output of previous module
        end else if (aAdder_idx==15 && conv3_ready)begin //if this module finished and the next one is ready 
            aAdder_idx=aAdder_idx+1; //wait for previous module to restart this one (no "if"s will work)
            //prepare next module (conv 3)
            PC3_image=aAdder_out1;
            conv3_idx=0; //start Conv 3
            aAdder_ready=1;
        end else if (aAdder_idx<15) begin
            aAdder_idx=aAdder_idx+1;
            aAdder_in1=aAdder_out1;
            aAdder_in2=aAdder_tmp[(aAdder_idx+1)*ARRAY_LEN*DATA_WIDTH-1-:ARRAY_LEN*DATA_WIDTH];
        end

        //Conv Layer 3 
        if(conv3_idx==0)begin
            conv3_ready=0;
            PC3_reset=1;
            j=0;
            PC3_passed_filters=PC3_filters[(j+1)*(number_of_filters3*25*DATA_WIDTH)-1-:number_of_filters3*25*DATA_WIDTH];
            conv3_idx=conv3_idx+1;
            //$stop; //stop here to see output of previous module
        end else if (PC3_done &&!conv3_ready&& tanh5_ready) begin //Input_SIZE clks passed && next module is ready-> init the next module 
            conv3_idx=conv3_idx+1;
            j=j+1;
            if(j==number_of_series3)begin
                //prepare next module (tanh)
                PC3_whole_output[j*(N3-4)*(N3-4)*number_of_filters3*DATA_WIDTH-1-:(N3-4)*(N3-4)*number_of_filters3*DATA_WIDTH]=PC3_output_fmap;
                tanh5_input_value=PC3_whole_output;
                tanh5_idx=0; //start next module
                conv3_ready=1; //mark this module as ready
            end else begin //part of the filters is done --> reset the module, pass new filters and store the output
                PC3_passed_filters=PC3_filters[(j+1)*number_of_filters3*25*DATA_WIDTH-1-:number_of_filters3*25*DATA_WIDTH];
                PC3_whole_output[j*number_of_filters3*DATA_WIDTH-1-:number_of_filters3*DATA_WIDTH]= PC3_output_fmap;
                PC3_reset=1;
            end
        end else if(conv3_idx<=25*(N3-4)*(N3-4) || !PC3_done)begin
            PC3_reset=0;
            conv3_idx=conv3_idx+1;
        end

        //Tanh fc 5
        if(tanh5_idx==0)begin
            tanh5_ready=0;
            tanh5_reset = 1;
            tanh5_idx=tanh5_idx+1; //wait for tanh
            //$stop; //stop here to see output of previous module
        end else if (tanh5_idx==9 && fc1_ready)begin //if this module finished and the next one is ready 
            tanh5_idx=tanh5_idx+1; //wait for previous module to restart this one (no "if"s will work)
            //prepare next module (fc 1)
            input_fc1=tanh5_output_value;
            fc1_idx=0; //start fc1
            tanh5_ready=1;
        end else if (tanh5_idx<9) begin
            tanh5_reset = 0;
            tanh5_idx=tanh5_idx+1; //wait for tanh
        end

        //Fc Layer 1 
        if(fc1_idx==0) begin
            fc1_ready=0;
            reset_fc1=1;
            start_fc1=1;  
            fc1_idx=fc1_idx+1;
            //$stop; //stop here to see output of previous module
        end else if (fc1_idx==FC_INPUT_SIZE1+1 && tanh6_ready ) begin //Input_SIZE clks passed && next module is ready-> init the next module 
            fc1_idx=fc1_idx+1;

            //prepare next module (tanh)
            tanh6_input_value=output_fc1;
            tanh6_idx=0;
            fc1_ready=1;
        end else if(fc1_idx<=FC_INPUT_SIZE1)begin
            reset_fc1=0;
            start_fc1=0;
            fc1_idx=fc1_idx+1;
        end

        //Tanh fc 6
        if(tanh6_idx==0)begin
            tanh6_ready=0;
            tanh6_reset= 1;
            tanh6_idx=tanh6_idx+1; //wait for tanh
            //$stop; //stop here to see output of previous module
        end else if (tanh6_idx==9 && fc2_ready)begin //if this module finished and the next one is ready 
            tanh6_idx=tanh6_idx+1; //wait for previous module to restart this one (no "if"s will work)
            //prepare next module (fc 2)
            input_fc2=tanh6_output_value;
            fc2_idx=0; //start fc2
            tanh6_ready= 1;
        end else if (tanh6_idx < 9) begin
            tanh6_reset= 0;
            tanh6_idx=tanh6_idx+1; //wait for tanh
        end

        //Fc Layer 2
        if(fc2_idx==0)begin
            fc2_ready=0; //mark as not ready to recieve from other modules
            reset_fc2=1;
            start_fc2=1;
            fc2_idx=fc2_idx+1;
            //$stop; //stop here to see output of previous module
        end else if (fc2_idx==FC_INPUT_SIZE2+1 && (sm_done||sm_idx==50)) begin //Input_SIZE clks passed  && next module ready -> init the next module  
            fc2_idx=fc2_idx+1; //wait for previous module to restart this one (no "if"s will work)

            //prepare the next module (softmax)
            sm_idx=0;
            //sm_reset=0;
            sm_input_value=output_fc2;
            fc2_ready=1; //mark this module as ready to recieve from its previous module (pipeline)
            //$stop; //stop here to see output of previous module
        end else if(fc2_idx<=FC_INPUT_SIZE2)begin
            reset_fc2=0;
            start_fc2=0;
            fc2_idx=fc2_idx+1;
        end

        //Softmax 
        if(sm_idx==0)begin
            sm_idx=1;
            sm_reset=1;
            //$stop; //stop here to see output of previous module
        end else if(sm_idx<50) begin //should take 40~32 only
            sm_idx=sm_idx+1;
            sm_reset=0;
        //when done "sm_done" will be 1
        end else
            sm_reset=0; // make sure it's 0 because this module's reset works on posedge
    end
end


//modules
SingleLayer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INPUT_SIZE(FC_INPUT_SIZE1), 
.file(file_fc1), .OUTPUT_SIZE(FC_OUTPUT_SIZE1)) //instantiate the module                                                     
SL1( .input_fc(input_fc1),
    .clk(clk),
    .start_fc(start_fc1),
    .reset(reset_fc1),
    .output_fc(output_fc1));
    
SingleLayer #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.DATA_WIDTH(DATA_WIDTH),.INPUT_SIZE(FC_INPUT_SIZE2), 
.file(file_fc2), .OUTPUT_SIZE(FC_OUTPUT_SIZE2)) //instantiate the module                                                     
SL2( .input_fc(input_fc2),
    .clk(clk),
    .start_fc(start_fc2),
    .reset(reset_fc2),
    .output_fc(output_fc2));


PC_MF #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.N(N3),.filters_number(number_of_filters3))
PC_MF3(.image(PC3_image),
.filters(PC3_passed_filters),
.reset(PC3_reset),
.clk(clk),
.output_fmap(PC3_output_fmap),
.done(PC3_done)
);

array_adder #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH),.ARRAY_LEN(ARRAY_LEN))
array_adder1( .in1(aAdder_in1),.in2(aAdder_in2),.clk(clk),.out1(aAdder_out1));

tanh_activation_function #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .numberOfInputs(AVG_FILTER*AVG_DIMENSION2*AVG_DIMENSION2)) 
tanh4 (
.input_tanh_function(tanh4_input_value),
.clk(clk),
.reset(tanh4_reset),
.output_tanh_function(tanh4_output_value)
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

avg_pooling_input_tensor #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH), .dimension(AVG_DIMENSION),
.DATA_WIDTH(DATA_WIDTH),.filter(AVG_FILTER)) avg (
.imgs_in(avg_input_value),
.reset_module(avg_reset),
.clk(clk),
.imgs_out(avg_output_value)
);
endmodule
