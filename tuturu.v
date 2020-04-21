`timescale 1ns / 1ps
//ieee multiplier module
module fpMul(flp_a,
flp_b,
sign,
exponent,
exp_sum,
prod,
clk
);

//regs and wires
wire [31:0] flp_a, flp_b;
wire clk;

reg sign;
reg [7:0] exponent;
reg [8:0] exp_sum;
reg [22:0] prod;
reg [48:0] product;
//inputs and outputs
input flp_a, flp_b ,clk;
output prod, exponent, sign, exp_sum ;

always @ (posedge clk) 
begin  
    product = {1'b1 ,flp_a[22:0]}*{1'b1,flp_b[22:0]};
    prod = 0;
    exp_sum = flp_a[30:23]+flp_b[30:23]-127;
    if (product[47]==1) exp_sum=exp_sum+1; //If we had a carry, then increment exponent
        exponent = exp_sum[7:0];
    sign = flp_a[31] ^ flp_b[31];
    if(product[47] ==1) begin
        prod = product[46:24];
    end else begin
        prod = product[45:23];
    end        
end
endmodule