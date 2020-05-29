//test bench for floating-point multiplication
module mul_flp_tb;

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;

reg [EXPONENT_WIDTH+MANTISSA_WIDTH:0] flp_a, flp_b;
reg clock;
wire sign;
wire [EXPONENT_WIDTH-1:0] exponent;
wire [EXPONENT_WIDTH:0] exp_sum;
wire [MANTISSA_WIDTH-1:0] prod;
initial
begin
clock = 1;

//+5 x +3 = +15 = 0b0100101110000000
// s ----e---- --------------f-------------
#2 flp_a = 32'b0100010100000000;
flp_b = 32'b0100001000000000;
//+6 x +4 = +24 = 0b0100111000000000
// s ----e---- --------------f-------------
#2 flp_a = 32'b0100011000000000;
flp_b = 32'b0100010000000000;
//5 x -5 = -25 = 0b1100111001000000
// s ----e---- --------------f-------------
#2 flp_a = 32'b0100010100000000;
flp_b = 32'b1100010100000000;
//+7 x -5 = -35 = 0b1101000001100000
// s ----e---- --------------f-------------
#2 flp_a = 32'b0100011100000000;
flp_b = 32'b1100010100000000;
//+25 x +25 = +625 = 0b0110000011100010
// s ----e---- --------------f-------------
#2 flp_a = 32'b0100111001000000;
flp_b = 32'b0100111001000000;
//continued on next page

//+76 x +55 = +4180 = 0b0110110000010101
// s ----e---- --------------f-------------
#2 flp_a = 32'b0101010011000000;
flp_b = 32'b0101001011100000;
//-48 x -17 = +816 = 0b0110001001100000
// s ----e---- --------------f-------------
#2 flp_a = 32'b1101001000000000;
flp_b = 32'b1100110001000000;
//+3724 x +853 = +3,176,572 = 0b0110001001100000 => Doesn't pass as it's larger than 16 bit
// s ----e---- --------------f-------------
#2 flp_a = 32'b0110101101000110;
flp_b = 32'b0110001010101010;

//+5 * 0.00381924584508 = 0.01909622922 = 0b0010010011100011;
#2 flp_a = 32'b0100010100000000;
flp_b = 32'b0001101111010010;

//More TESTS needs to be converted: 
/*
#2
flp_a= 32'b00000000000000000000000000000000; //0  
flp_b= 32'b00000000000000000000000000000000; //0  

#2

flp_a= 32'b11000000111100000000000000000000; //-7.5  
flp_b= 32'b01000010000011000000000000000000; //35   

#2

flp_a= 32'b01000010001101000000000000000000; //45  
flp_b= 32'b11000000010000000000000000000000; //-3   

#2

flp_a= 32'b01000000000000000000000000000000; //2  
flp_b= 32'b01000000011000000000000000000000; //3.5   


#2

flp_a= 32'b01000001000100000000000000000000; //9  
flp_b= 32'b11000010101100000000000000000000; //-88  


#2

flp_a= 32'b00000000000000000000000000000000; //0  
flp_b= 32'b01000001010000000000000000000000; //12  

#2

flp_a =32'b00111111000000000000000000000000; //.5  
flp_b =32'b00111111000000000000000000000000; //.5  

#2

flp_a =32'b11000010110001100000000000000000; //-99  
flp_b =32'b11000010000001000000000000000000; //-33  

#2

flp_a =32'b00111111000000000000000000000000; //0.5  
flp_b =32'b00111110100110011001100110011000; //0.3  


#2

flp_a =32'b00111110010011001100110011001100; //0.2  
flp_b =32'b00111111000000000000000000000000; //0.5  

#2

flp_a =32'b01000000001000000000000000000000; //2.5  
flp_b =32'b01000000100100000000000000000000; //4.5  

#2

flp_a =32'b01000000001000000000000000000000; //2.5  
flp_b =32'b01000001001000000000000000000000; //10  
*/
#2 $stop;
end


always begin
     #1  clock = ~clock; 
    end
        
//instantiate the module into the test bench
fpMul #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) inst1 (
.flp_a(flp_a),
.flp_b(flp_b),
.sign(sign),
.exponent(exponent),
.prod(prod),
.clk(clock)
);
endmodule
