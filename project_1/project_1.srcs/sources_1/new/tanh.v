`timescale 1ns / 1ps

module tanh( input_x,clk,output_tanh);
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
input [DATA_WIDTH-1:0] input_x;
input clk;
output reg[DATA_WIDTH-1:0] output_tanh;
reg [DATA_WIDTH-1:0] x_power_two;
reg [DATA_WIDTH-1:0] x_power_three;
reg [DATA_WIDTH-1:0] x_power_five;
reg [DATA_WIDTH-1:0] x_power_seven;
reg [DATA_WIDTH-1:0] first_constant=32'b10111110101010101010101010101011;
reg [DATA_WIDTH-1:0] second_constant=32'b00111110000010001000100010001001;
reg [DATA_WIDTH-1:0] third_constant=32'b10111101010111010000110111010001;
reg [DATA_WIDTH-1:0] temp_mul_a;
reg [DATA_WIDTH-1:0] temp_mul_b;
wire [DATA_WIDTH-1:0] output_tmp_mul;
reg [DATA_WIDTH-1:0] temp_add_a;
reg [DATA_WIDTH-1:0] temp_add_b;
wire [DATA_WIDTH-1:0] output_tmp_add;


reg [4:0] i;
wire done;

initial 
begin
    i=0;
end
always@(posedge clk)
begin
    if(i==0)
    begin
        temp_mul_a=input_x;
        temp_mul_b=input_x;
    end
    else if(i==1)
    begin
        temp_mul_a=x_power_two;
        temp_mul_b=input_x;
    end  
    else if(i==2)
    begin
        temp_mul_a=x_power_two;
        temp_mul_b=x_power_three;
    end 
    else if(i==3)
    begin
        temp_mul_a=x_power_two;
        temp_mul_b=x_power_five;
    end
    else if(i==4)
    begin
        temp_mul_a=x_power_three;
        temp_mul_b=first_constant;
    end  
    else if(i==5)
    begin
        temp_mul_a=x_power_five;
        temp_mul_b=second_constant;
    end
    else if(i==6)
    begin
        temp_mul_a=x_power_seven;
        temp_mul_b=third_constant;
    end 
end

always@(negedge clk)
begin
    if(i==0)
    begin
        x_power_two=output_tmp_mul;
    end
    else if(i==1)
    begin
        x_power_three=output_tmp_mul;
    end
    else if(i==2)
    begin
        x_power_five=output_tmp_mul;
    end
    else if(i==3)
    begin
        x_power_seven=output_tmp_mul;
    end
    else if(i==4)
    begin
        temp_add_a=output_tmp_mul;
        temp_add_b=input_x;
    end
    else if(i==5)
    begin
        temp_add_a=output_tmp_add;
        temp_add_b=output_tmp_mul;
    end
    else if(i==6)
    begin
        temp_add_a=output_tmp_add;
        temp_add_b=output_tmp_mul;
    end
    if(i!=7)
    begin
        i=i+1;
    end
end
always@(posedge done && i==7)
begin
        output_tanh=output_tmp_add;
end
fpMul #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) fmul(
.flp_a(temp_mul_a),
.flp_b(temp_mul_b),
.sign(output_tmp_mul[EXPONENT_WIDTH+MANTISSA_WIDTH]),
.exponent(output_tmp_mul[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]),
.prod(output_tmp_mul[MANTISSA_WIDTH-1:0]),
.clk(clk)
);

fp_add_2 #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) fadd(
.A_FP(temp_add_a),
.B_FP(temp_add_b),
.sign(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH]),
.exponent(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]),
.mantissa(output_tmp_add[MANTISSA_WIDTH-1:0]),
.clk(clk),
.done(done)
);
endmodule
