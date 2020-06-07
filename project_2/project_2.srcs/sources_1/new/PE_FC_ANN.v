`timescale 1ns / 1ps
module PE_FC_ANN ( input_fc,iweight_FC,clk,start_FC,output_fc,test_multi);
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
input [DATA_WIDTH-1:0]       input_fc ;
input [DATA_WIDTH-1:0]      iweight_FC; 
input clk ,start_FC;
output reg[DATA_WIDTH-1:0] output_fc ;
output reg[DATA_WIDTH-1:0] test_multi ;
wire [DATA_WIDTH-1:0] output_tmp_mul;
wire [DATA_WIDTH-1:0] output_tmp_add;
reg [4:0] x;
reg [4:0] i;
wire done;

always@(posedge start_FC)
begin
    if (start_FC==1) begin
        output_fc=32'h00000000000000000000000000000000;
        test_multi=32'h00000000000000000000000000000000;
    end else begin 
        output_fc = output_tmp_add;
        test_multi = output_tmp_mul;
    end
    
end
always@ (posedge done)
begin
    if (start_FC==0) begin 
        output_fc = output_tmp_add;
        test_multi = output_tmp_mul;
    end
end



fpMul #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) fmul(
.flp_a(input_fc),
.flp_b(iweight_FC),
.sign(output_tmp_mul[EXPONENT_WIDTH+MANTISSA_WIDTH]),
.exponent(output_tmp_mul[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]),
.prod(output_tmp_mul[MANTISSA_WIDTH-1:0]),
.clk(clk)
);

fp_add_2 #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) fadd(
.A_FP(output_fc),
.B_FP(output_tmp_mul),
.sign(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH]),
.exponent(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]),
.mantissa(output_tmp_add[MANTISSA_WIDTH-1:0]),
.clk(clk),
.done(done)
);
endmodule