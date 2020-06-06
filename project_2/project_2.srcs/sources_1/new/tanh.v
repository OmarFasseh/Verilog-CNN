`timescale 1ns / 1ps

module tanh( input_x, clk, reset, output_tanh);
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
input [DATA_WIDTH-1:0] input_x;
input clk;
input reset;
output reg[DATA_WIDTH-1:0] output_tanh;
reg [DATA_WIDTH-1:0] x_power_two;                           //X^2
reg [DATA_WIDTH-1:0] x_power_three;                         //X^3
reg [DATA_WIDTH-1:0] x_power_five;                          //X^5
reg [DATA_WIDTH-1:0] x_power_seven;                         //X^7
reg [DATA_WIDTH-1:0] first_constant=16'b1011010101010101;   // -1/3
reg [DATA_WIDTH-1:0] second_constant=16'b0011000001000100;  // 2/15
reg [DATA_WIDTH-1:0] third_constant=16'b1010101011101000;   // -17/315
reg [DATA_WIDTH-1:0] temp_mul_a;                            // multiplier input 1
reg [DATA_WIDTH-1:0] temp_mul_b;                            // multiplier input 2
wire [DATA_WIDTH-1:0] output_tmp_mul;                       // multiplier output
reg [DATA_WIDTH-1:0] temp_add_a;                            // adder input 1
reg [DATA_WIDTH-1:0] temp_add_b;                            // adder input 2
wire [DATA_WIDTH-1:0] output_tmp_add;                       // adder output


reg [4:0] i;
wire done;

initial 
begin
    i=0;
end
always@(posedge clk) //@posedge we multiply
begin
    if(reset==0)
    begin
        if(i==0)      //X * X
        begin
            temp_mul_a=input_x;       //Set first multiplier input to X
            temp_mul_b=input_x;       //Set second multiplier input to X
        end
        else if(i==1) //X^2 * X
        begin
            temp_mul_a=x_power_two;   //Set first multiplier input to X^2
            temp_mul_b=input_x;       //Set second multiplier input to X
        end  
        else if(i==2) //X^2 * X^3
        begin
            temp_mul_a=x_power_two;   //Set first multiplier input to X^2
            temp_mul_b=x_power_three; //Set second multiplier input to X^3
        end 
        else if(i==3) //X^2 * X^5
        begin
            temp_mul_a=x_power_two;   //Set first multiplier input to X^2
            temp_mul_b=x_power_five;  //Set second multiplier input to X^5
        end
        else if(i==4) //X^3 * -1/3
        begin
            temp_mul_a=x_power_three; //Set first multiplier input to X^3
            temp_mul_b=first_constant;//Set second multiplier input to -1/3
        end  
        else if(i==5) //X^5 * 2/15
        begin
            temp_mul_a=x_power_five;   //Set first multiplier input to X^5
            temp_mul_b=second_constant;//Set second multiplier input to 2/15
        end
        else if(i==6) //X^7 * -17/315
        begin
            temp_mul_a=x_power_seven; //Set first multiplier input to X^7
            temp_mul_b=third_constant;//Set second multiplier input to -17/315
        end
     end
     else //@reset=1
     begin
        i=0;
     end
end

always@(negedge clk)  //@negedge we add
begin
    if(reset==0)
    begin
        if(i==0)      //recieve X^2
        begin
            x_power_two=output_tmp_mul; 
        end
        else if(i==1) //recieve X^3
        begin
            x_power_three=output_tmp_mul;
        end
        else if(i==2) //recieve X^5
        begin
            x_power_five=output_tmp_mul;
        end
        else if(i==3) //recieve X^7
        begin
            x_power_seven=output_tmp_mul;
        end
        else if(i==4) //(-1/3 * X^3) + X
        begin
            temp_add_a=output_tmp_mul;  //Set first adder input to -1/3 * X^3
            temp_add_b=input_x;         //Set second adder input to X
        end
        else if(i==5) //(2/15 * X^5) + (-1/3 * X^3) + X
        begin
            temp_add_a=output_tmp_add;  //Set first adder input to (-1/3 * X^3) + X
            temp_add_b=output_tmp_mul;  //Set second adder input to 2/15 * X^5
        end
        else if(i==6) //(-17/315 * X^7) + (2/15 * X^5) + (-1/3 * X^3) + X
        begin
            temp_add_a=output_tmp_add;  //Set first adder input to (2/15 * X^5) + (-1/3 * X^3) + X
            temp_add_b=output_tmp_mul;  //Set second adder input to -17/315 * X^7
        end
        else if(i==7) //recieve the final output
        begin
            output_tanh=output_tmp_add; //set the final output of series
            if(input_x[DATA_WIDTH-2:DATA_WIDTH-EXPONENT_WIDTH-1] >= 5'b01111 && input_x[DATA_WIDTH-2:DATA_WIDTH-EXPONENT_WIDTH-1] < 5'b10000) //check if absolute of input is between 1 and 2
            begin
                output_tanh[DATA_WIDTH-1]=input_x[DATA_WIDTH-1]; //set the output sign by the input sign
                output_tanh[DATA_WIDTH-2:0]=15'b011101100110011; //set the output exponent and mantissa to 0.9
            end
            else if(input_x [DATA_WIDTH-2:DATA_WIDTH-EXPONENT_WIDTH-1] >= 5'b10000) //check if absolute of input is higher than 2
            begin
                output_tanh[DATA_WIDTH-1]=input_x[DATA_WIDTH-1]; //set the output sign by the input sign
                output_tanh[DATA_WIDTH-2:0]=15'b011110000000000; //set the output exponent and mantissa to 1
            end
        end
        if(i!=8) 
        begin
            i=i+1;
        end
        if(i > 7) //end of cycle, reset all regs
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
    else //@ reset=1
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
