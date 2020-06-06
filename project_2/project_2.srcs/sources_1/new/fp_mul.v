`timescale 1ns / 1ps
//ieee multiplier module
module fpMul(flp_a,
flp_b,
sign,
exponent,
prod,
clk
);

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;

//regs and wires
wire [EXPONENT_WIDTH+MANTISSA_WIDTH:0] flp_a, flp_b;
wire clk;

reg sign;
reg [EXPONENT_WIDTH-1:0] exponent;
reg [EXPONENT_WIDTH:0] exp_sum;
reg [MANTISSA_WIDTH-1:0] prod;
reg [2*(MANTISSA_WIDTH+1):0] product;
//inputs and outputs
input flp_a, flp_b ,clk;
output prod, exponent, sign ;
//reg cat_a,cat_b;

always @ (posedge clk) 
begin  
    //extra accurate but might cause issues?
    /*if(flp_a[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]>0) cat_a=1;
    else cat_a=0;
    if(flp_b[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]>0) cat_b=1;
    else cat_b=0;
    product = {cat_a ,flp_a[MANTISSA_WIDTH-1:0]}*{cat_b ,flp_b[MANTISSA_WIDTH-1:0]};*/
    product = {1'b1 ,flp_a[MANTISSA_WIDTH-1:0]}*{1'b1 ,flp_b[MANTISSA_WIDTH-1:0]};
    prod = 0;
    exp_sum = flp_a[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]+flp_b[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH];
    if (product[2*MANTISSA_WIDTH+1]==1) exp_sum=exp_sum+1; //If we had a carry, then increment exponent
    sign = flp_a[EXPONENT_WIDTH+MANTISSA_WIDTH] ^ flp_b[EXPONENT_WIDTH+MANTISSA_WIDTH];
    if(product[2*MANTISSA_WIDTH+1] ==1) begin
        prod = product[2*MANTISSA_WIDTH:MANTISSA_WIDTH+1];
    end else begin
        prod = product[2*MANTISSA_WIDTH-1:MANTISSA_WIDTH];
    end
    //underflow case
    if(exp_sum<(2**(EXPONENT_WIDTH-1)-1))begin
            //prod = {1'b1 ,prod } >> (2**(EXPONENT_WIDTH-1)-1)-exp_sum; //extra unneeded accuracy
            exp_sum=0;
     end else
            exp_sum=exp_sum-(2**(EXPONENT_WIDTH-1)-1);
     exponent = exp_sum[EXPONENT_WIDTH-1:0];
    
    //handle case of multiplying by zero
    if(flp_a[MANTISSA_WIDTH+EXPONENT_WIDTH-1:0]==0 || flp_b[MANTISSA_WIDTH+EXPONENT_WIDTH-1:0]==0) begin
        exponent = 0;
        prod = 0;
        sign = 0;
    end        
end
endmodule