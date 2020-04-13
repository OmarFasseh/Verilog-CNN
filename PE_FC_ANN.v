module PE_FC_ANN 
( input_fc,iweight_FC,clk,start_FC,output_fc
 );
parameter DATA_WIDTH = 16;
input [DATA_WIDTH-1:0]       input_fc ;
input [DATA_WIDTH-1:0]      iweight_FC; 
input     clk ,start_FC;
output reg[DATA_WIDTH*2-1:0] output_fc ;
wire [DATA_WIDTH*2-1:0] output_tmp_mul;
wire [DATA_WIDTH*2-1:0] output_tmp_add;

always@(posedge clk)
begin

    if (start_FC==1) begin
            output_fc=32'h00000000;
    end else begin
        output_fc = output_tmp_add;
    end
end

fpMul fmul(
.flp_a(input_fc),
.flp_b(iweight_FC),
.sign(output_tmp_mul[31]),
.exponent(output_tmp_mul[30:23]),
.prod(output_tmp_mul[22:0]),
.clock(clk)
);

fp_add fadd(
.A_FP(output_fc),
.B_FP(output_tmp_mul),
.sign(output_tmp_add[31]),
.exponent(output_tmp_add[30:23]),
.mantissa(output_tmp_add[22:0]),
.clock(clk)
);
endmodule