//test bench for floating-point multiplication
`timescale 1ns / 1ps
module div_flp_tb;

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;

reg [MANTISSA_WIDTH+EXPONENT_WIDTH:0] flp_a, flp_b;
reg clock;
wire div_done;
reg div_reset;
wire [MANTISSA_WIDTH+EXPONENT_WIDTH:0] finalans;
initial
begin
clock = 1;
div_reset=0;

//For simple representation for test cases find test cases table below
// s ----e---- --------------f-------------

//1.5/2=0.75
  /* flp_a = 32'b00111111110000000000000000000000;
    flp_b = 32'b01000000000000000000000000000000;*/
   #1 div_reset=1;
   flp_a = 16'b0011111000000000;
   flp_b = 16'b0100000000000000;
   #1  div_reset=0;
// s ----e---- --------------f-------------
// 0.1/0.2=0.5
   /*flp_a = 32'b00111101110011001100110011001101;
   flp_b = 32'b00111110010011001100110011001101;*/
   #12 div_reset=1;
   flp_a = 16'b0010111001100110;
   flp_b = 16'b0011001001100110;
   #1  div_reset=0;
// s ----e---- --------------f-------------   
//0/0.2=0
  /* flp_a = 32'b00000000000000000000000000000000;
   flp_b = 32'b00111110010011001100110011001101;*/
   #12 div_reset=1;
   flp_a = 16'b0000000000000000;
   flp_b = 16'b0011001001100110;
   #1  div_reset=0;
// s ----e---- --------------f-------------      
//5/2=2.5
  /* flp_a = 32'b01000000101000000000000000000000;
   flp_b = 32'b01000000000000000000000000000000; */
   #12 div_reset=1; 
   flp_a = 16'b0100010100000000;
   flp_b = 16'b0100000000000000;
   #1  div_reset=0;
// s ----e---- --------------f-------------      
//6/2=3 
  /* flp_a = 32'b01000000110000000000000000000000;
   flp_b = 32'b01000000000000000000000000000000; */ 
   #12 div_reset=1;
   flp_a = 16'b0100011000000000;
   flp_b = 16'b0100000000000000; 
   #1  div_reset=0;
// s ----e---- --------------f-------------      
//100/20=5
  /* flp_a = 32'b01000010110010000000000000000000;
   flp_b = 32'b01000001101000000000000000000000; */
  #12 div_reset=1;
  flp_a = 16'b0101011001000000;
  flp_b = 16'b0100110100000000; 
  #1  div_reset=0;
// s ----e---- --------------f-------------      
//16/8 =2
/*
#5 flp_a=32'b01000001100000000000000000000000;
   flp_b=32'b01000001000000000000000000000000;*/
  #12 div_reset=1;
  flp_a = 16'b0100110000000000;
  flp_b = 16'b0100100000000000; 
  #1  div_reset=0;
// s ----e---- --------------f-------------     
//6/6=1
  /* flp_a=32'b01000000110000000000000000000000;
   flp_b=32'b01000000110000000000000000000000;*/
  #12 div_reset=1;
  flp_a = 16'b0100011000000000;
  flp_b = 16'b0100011000000000; 
  #1  div_reset=0;
// s ----e---- --------------f-------------      
//1.115/1.2 =0.929
/*#5 flp_a=32'b00111111100011101011100001010010;
   flp_b=32'b00111111100110011001100110011010;*/
  #12 div_reset=1;
  flp_a = 16'b0011110001110110;
  flp_b = 16'b0011110011001101;
  #1  div_reset=0;
// s ----e---- --------------f-------------    
//99/5=19.8
   /*flp_a=32'b01000010110001100000000000000000;
   flp_b=32'b01000000101000000000000000000000;*/
  #12 div_reset=1;
  flp_a = 16'b0101011000110000;
  flp_b = 16'b0100010100000000; 
  #1  div_reset=0;
// s ----e---- --------------f-------------   
//19.4/172.6=0.1124
  #12 div_reset=1;
  flp_a = 16'b0100110011011010;
  flp_b = 16'b0101100101100101; 
  #1  div_reset=0;
#100 $stop;
end

// Test cases table
// 1.5/2=0.75  | 0.1/0.2=0.5 | 0/x=0  | 5/2=2.5 | 6/2=3  | 100/20=5  |  16/8=2   | 6/6=1     |1.115/1.2 =0.929 | 99/5=19.8  | 19.4/172.6=0.1124
// 3A00        |     3800    |  0000  |  4100   |  4200  |  4500     |    4000   |  3C00     |      3B70       |    4D00    |      2F34

always begin
     #1  clock = ~clock; 
    end
        
//instantiate the module into the test bench
fpDiv #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) inst1 (
.flp_a(flp_a),
.flp_b(flp_b),
.sign(finalans[MANTISSA_WIDTH+EXPONENT_WIDTH]),
.exponent(finalans[MANTISSA_WIDTH+EXPONENT_WIDTH-1:MANTISSA_WIDTH]),
.div(finalans[MANTISSA_WIDTH-1:0]),
.clk(clock),
.div_done(div_done),
.div_reset(div_reset)
);
endmodule
