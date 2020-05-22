//test bench for exp
module exponential_tb;

parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;

reg [31:0] input_value;
reg clock;
wire [31:0] output_value;
wire done_exp;
initial
begin
clock =1;

//  e^2
// s ----e---- --------------f-------------
 input_value = 32'b01000000000000000000000000000000;
 //  e^3
 // s ----e---- --------------f-------------
#20 input_value = 32'b01000000010000000000000000000000;
//  e^3.4
// s ----e---- --------------f-------------
#20 input_value = 32'b01000000010110011001100110011010;
//  e^-2
// s ----e---- --------------f-------------
#20 input_value = 32'b11000000000000000000000000000000;
//  e^-1.2
// s ----e---- --------------f-------------
#20 input_value = 32'b10111111100110011001100110011010;
//  e^5
// s ----e---- --------------f-------------
#20 input_value = 32'b01000000101000000000000000000000;
//  e^0.01
// s ----e---- --------------f-------------
#20 input_value = 32'b00111100001000111101011100001010;
//  e^0.001
// s ----e---- --------------f-------------
#20 input_value = 32'b00111010100000110001001001101111;
//  e^-0.01
// s ----e---- --------------f-------------
#20 input_value = 32'b10111100001000111101011100001010;
//  e^-0.001
// s ----e---- --------------f-------------
#20 input_value = 32'b10111010100000110001001001101111;
#25 $stop;
end

// e^-0.001        |    e^-0.01    |    e^0.001      |  e^0.01        |     e^5        |  e^-1.2         |   e^-2          | e^3.4         |  e^3           |      e^2        |
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// 0.999000549316  | 0.99004983902 |  1.00100040436  |  1.01005005836 | 113.118034363  | 0.301811099052  |  0.155555725098 | 28.2305774689 |  19.4124965668 | 7.35555553436   |
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//   3f7fbe80      |   3f7d73e8    |   3f8020c8      |  3f814952      | 42e23c6f       |  3e9a86fc       | 3e1f4a00        | 41e1d839      |   419b4ccb     | 40eb60b6        |


always begin
     #1  clock = ~clock; 
    end
        
//instantiate the module into the test bench
exponential #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) inst1 (
.input_exp(input_value),
.clk(clock),
.output_exp(output_value),
.done_exp(done_exp)
);
endmodule
