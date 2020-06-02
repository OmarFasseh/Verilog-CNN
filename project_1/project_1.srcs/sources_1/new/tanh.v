`timescale 1ns / 1ps

module tanh( input_x, clk, reset, output_tanh);
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
input [DATA_WIDTH-1:0] input_x;
input clk;
input reset;
output reg[DATA_WIDTH-1:0] output_tanh;
reg [DATA_WIDTH-1:0] x_power_two;
reg [DATA_WIDTH-1:0] x_power_three;
reg [DATA_WIDTH-1:0] x_power_five;
reg [DATA_WIDTH-1:0] x_power_seven;
reg [DATA_WIDTH-1:0] first_constant=16'b1011010101010101;
reg [DATA_WIDTH-1:0] second_constant=16'b0011000001000100;
reg [DATA_WIDTH-1:0] third_constant=16'b1010101011101000;
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
    if(reset==0)
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
     else
     begin
        i=0;
     end
end

/*always@(negedge clk && startTANH)
begin
    $stop;
    i=0;
    x_power_two=32'h00000000000000000000000000000000;
    x_power_three=32'h00000000000000000000000000000000;
    x_power_five=32'h00000000000000000000000000000000;
    x_power_seven=32'h00000000000000000000000000000000;
    temp_mul_a=32'h00000000000000000000000000000000;
    temp_mul_b=32'h00000000000000000000000000000000;
    temp_add_a=32'h00000000000000000000000000000000;
    temp_add_b=32'h00000000000000000000000000000000;
end*/

always@(negedge clk)
begin
    if(reset==0)
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
        else if(i==7)
        begin
            output_tanh=output_tmp_add;
            if(input_x[DATA_WIDTH-2:DATA_WIDTH-EXPONENT_WIDTH-1] >= 5'b01111 && input_x[DATA_WIDTH-2:DATA_WIDTH-EXPONENT_WIDTH-1] < 5'b10000)
            begin
                output_tanh[DATA_WIDTH-1]=input_x[DATA_WIDTH-1];
                output_tanh[DATA_WIDTH-2:0]=15'b011101100110011;
            end
            else if(input_x [DATA_WIDTH-2:DATA_WIDTH-EXPONENT_WIDTH-1] >= 5'b10000)
            begin
                output_tanh[DATA_WIDTH-1]=input_x[DATA_WIDTH-1];
                output_tanh[DATA_WIDTH-2:0]=15'b011110000000000;
            end
        end
        if(i!=8)
        begin
            i=i+1;
        end
        if(i > 7)
        begin
            i=0;
            x_power_two=32'h00000000000000000000000000000000;
            x_power_three=32'h00000000000000000000000000000000;
            x_power_five=32'h00000000000000000000000000000000;
            x_power_seven=32'h00000000000000000000000000000000;
            temp_mul_a=32'h00000000000000000000000000000000;
            temp_mul_b=32'h00000000000000000000000000000000;
            temp_add_a=32'h00000000000000000000000000000000;
            temp_add_b=32'h00000000000000000000000000000000;
        end
    end
    else
    begin
        i=0;
    end
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
