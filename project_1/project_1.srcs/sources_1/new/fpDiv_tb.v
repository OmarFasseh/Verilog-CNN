//test bench for floating-point multiplication
module div_flp_tb;

parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;

reg [31:0] flp_a, flp_b;
reg clock;
wire div_done;
reg div_reset;
wire [31:0] finalans;
initial
begin
clock = 1;
div_reset=0;
// s ----e---- --------------f-------------
//1.5/2=0.75
   flp_a = 32'b00111111110000000000000000000000;
    flp_b = 32'b01000000000000000000000000000000;
//$stop;
// 0.1/0.2=0.5
 #12 div_reset=1;
   flp_a = 32'b00111101110011001100110011001101;
   flp_b = 32'b00111110010011001100110011001101;
   #1  div_reset=0;
//$stop;
//0/0.2=0
   #12 div_reset=1;
   flp_a = 32'b00000000000000000000000000000000;
   flp_b = 32'b00111110010011001100110011001101;
   #1  div_reset=0;
//5/2=2.5
   #12 div_reset=1;
   flp_a = 32'b01000000101000000000000000000000;
   flp_b = 32'b01000000000000000000000000000000;  
   #1  div_reset=0;
//6/2=3 
   #12 div_reset=1;
   flp_a = 32'b01000000110000000000000000000000;
   flp_b = 32'b01000000000000000000000000000000;   
   #1  div_reset=0;
//100/20=5
   #12 div_reset=1;
   flp_a = 32'b01000010110010000000000000000000;
   flp_b = 32'b01000001101000000000000000000000; 
   #1  div_reset=0;
   
//16/8 =2
//error
/*
#5 flp_a=32'b01000001100000000000000000000000;
   flp_b=32'b01000001000000000000000000000000;*/
   
//6/6=1
   #12 div_reset=1;
   flp_a=32'b01000000110000000000000000000000;
   flp_b=32'b01000000110000000000000000000000;
   #1  div_reset=0;
   
//1.115/1.2
//error
/*#5 flp_a=32'b00111111100011101011100001010010;
   flp_b=32'b00111111100110011001100110011010;*/

//99/5=19.8
   #12 div_reset=1;
   flp_a=32'b01000010110001100000000000000000;
   flp_b=32'b01000000101000000000000000000000;
   #1  div_reset=0;
#100 $stop;
end


always begin
     #1  clock = ~clock; 
    end
        
//instantiate the module into the test bench
fpDiv #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) inst1 (
.flp_a(flp_a),
.flp_b(flp_b),
.sign(finalans[31]),
.exponent(finalans[30:23]),
.div(finalans[22:0]),
.clk(clock),
.div_done(div_done),
.div_reset(div_reset)
);
endmodule
