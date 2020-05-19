//test bench for floating-point addition
`timescale 1ns / 1ps

module add_flp3_tb;

parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
    reg [31:0] A, B;
    reg clock;
    wire sign_C;
    wire [7:0] exp_C;
    wire [22:0] mantissa_C;
    initial //display variables
    $monitor ("sign=%b, exp_biased=%b, sum=%b",sign_C, exp_C, mantissa_C);
    
    initial //apply input vectors
    begin
        clock = 1;
        //+7.25 + + 0.375 = + 7.625
                // s ----e---- --------------M-------------
        #2 A = 32'b0_1000_0001_1101_0000_0000_0000_0000_000;
           B = 32'b0_0111_1101_1000_0000_0000_0000_0000_000;
        //+6 + +7 = + 13
                // s ----e---- --------------M-------------
        #2 A = 32'b0_1000_0001_1000_0000_0000_0000_0000_000;
           B = 32'b0_1000_0001_1100_0000_0000_0000_0000_000;
            // = -10
        #2 A = 32'b11000000111000000000000000000000;
           B = 32'b11000000010000000000000000000000;
            // = 4
        #2 A = 32'b01000000111000000000000000000000;
           B = 32'b11000000010000000000000000000000;
            // = -4
        #2 A = 32'b11000000111000000000000000000000;
           B = 32'b01000000010000000000000000000000; 
            //65 - 63 = 2
        #2 A = 32'b01000010100000100000000000000000;
           B = 32'b11000010011111000000000000000000;
           //4 - 4 = 0
        #2 A = 32'b01000000100000000000000000000000;
           B = 32'b11000000100000000000000000000000;
        #2 $stop;
    end
    
    always begin
         #1  clock = ~clock; 
        end
    
    fp_add_2 #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH))
    fp_add1 ( //instantiate the module
    .A_FP(A),
    .B_FP(B),
    .sign(sign_C),
    .exponent(exp_C),
    .mantissa(mantissa_C),
    .clk(clock));
endmodule
