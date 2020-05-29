`timescale 1ns / 1ps
module fp_div(
flp_a,
sign,
exponent,
prod,
clk
  );
  
  parameter EXPONENT_WIDTH = 8;
    parameter MANTISSA_WIDTH = 23;
    
    //regs and wires
    wire [EXPONENT_WIDTH+MANTISSA_WIDTH:0] flp_a ;
    wire clk;
    
    reg sign;
    reg [EXPONENT_WIDTH-1:0] exponent;
    reg [EXPONENT_WIDTH:0] exp_sum;
    reg [MANTISSA_WIDTH-1:0] prod;
    reg [2*(MANTISSA_WIDTH+1):0] product;
    reg [EXPONENT_WIDTH+MANTISSA_WIDTH:0] flp_b = 32'b00111110100000000000000000000000; //0.25
    //inputs and outputs
    input flp_a,clk;
    output prod, exponent, sign ;
    
    always @ (negedge clk) 
    begin  
        product = {1'b1 ,flp_a[MANTISSA_WIDTH-1:0]}*{1'b1,flp_b[MANTISSA_WIDTH-1:0]};
        
        prod = 0;
        exp_sum = flp_a[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]+flp_b[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]-(2**(EXPONENT_WIDTH-1)-1);
        if (product[2*MANTISSA_WIDTH+1]==1) exp_sum=exp_sum+1; //If we had a carry, then increment exponent
            exponent = exp_sum[EXPONENT_WIDTH-1:0];
        sign = flp_a[EXPONENT_WIDTH+MANTISSA_WIDTH] ^ flp_b[EXPONENT_WIDTH+MANTISSA_WIDTH];
        if(product[2*MANTISSA_WIDTH+1] ==1) begin
            prod = product[2*MANTISSA_WIDTH:MANTISSA_WIDTH+1];
        end else begin
            prod = product[2*MANTISSA_WIDTH-1:MANTISSA_WIDTH];
        end
        //handle case of multiplying by zero
        if(flp_a[MANTISSA_WIDTH+EXPONENT_WIDTH-1:0]==0 ) begin
            exponent = 0;
            prod = 0;
            sign = 0;
        end        
    end
  
    
endmodule