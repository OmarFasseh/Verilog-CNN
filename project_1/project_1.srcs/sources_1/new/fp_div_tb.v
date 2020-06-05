`timescale 1ns / 1ps



module fp_div_tb;
parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;

reg [EXPONENT_WIDTH+MANTISSA_WIDTH:0] flp_a;
reg clock;
wire sign;
wire [EXPONENT_WIDTH-1:0] exponent;
wire [EXPONENT_WIDTH:0] exp_sum;
wire [MANTISSA_WIDTH-1:0] prod;

initial
begin
clock = 0;

//+5 / +4 = 1.25
// s ----e---- --------------f-------------
#2 flp_a = 16'b0100010100000000;

//+6 / 4 = +1.5
// s ----e---- --------------f-------------
#2 flp_a = 16'b0100011000000000;
//-5 /4 = -1.25
// s ----e---- --------------f-------------
#2 flp_a = 16'b1100010100000000;
//+7 /4 = 1.75
// s ----e---- --------------f-------------
#2 flp_a = 16'b0100011100000000;
//+25 /4 = +6.25
// s ----e---- --------------f-------------
#2 flp_a = 16'b0100111001000000;
//continued on next page

//+76 / 4 = 19
// s ----e---- --------------f-------------
#2 flp_a = 16'b0101010011000000;
//-48 / 4 = -12
// s ----e---- --------------f-------------
#2 flp_a = 16'b1101001000000000;
//+3724 /4 = 931
// s ----e---- --------------f-------------
#2 flp_a = 16'b0110101101000110;

// 0.00381924584508/4 = 0.0.00095;
#2 flp_a = 16'b0001101111010010;

//More TESTS
#2
flp_a= 16'b0000000000000000; //0 /4=0   


#2

flp_a= 16'b0100000000000000; //2 /4=0.5   


#2

flp_a= 16'b0100100010000000; //9/4=2.25   

#2

flp_a =16'b0011100000000000; //.5 /4= 0.125


#2

flp_a =16'b0011001001100110; //0.2 /4 =0.05

#2

flp_a =16'b0100000100000000; //2.5/4=0.625  

#2

flp_a =16'b0100100100000000; //10 /4=2.5 

#2 $stop;


end

always begin
     #1  clock = ~clock; 
    end
        
//instantiate the module into the test bench
fp_div #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) inst1 (
.flp_a(flp_a),
.sign(sign),
.exponent(exponent),
.prod(prod),
.clk(clock)
);





endmodule
