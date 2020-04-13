module PE_FC_ANN 
( input_fc,iweight_FC,clk,start_FC,output_fc, output_tmp
 );
parameter DATA_WIDTH = 16;
input [DATA_WIDTH-1:0]       input_fc ;
input [DATA_WIDTH-1:0]      iweight_FC; 
input     clk ,start_FC;
output reg[DATA_WIDTH*2-1:0] output_fc ;
output reg [DATA_WIDTH*2-1:0] output_tmp;

always@(posedge clk)
begin

    if (start_FC==1) begin
            output_fc=32'h00000000;
            output_tmp=32'h00000000;
    // Sequential MAC Units >>> Very Slow !
    // TODO1       : Convert to  Parallel MAC Units 
    // TODO2       : Do Single Precision Multiply and Single Precision Addition
    // COMPETITION1: Do two implementations to get the maximum scores  
    //               score1 = 80/#Cycles + 20/(#LUTs) + 10/(# of Slice Registers)  
    //               score2 = 20/#Cycles + 80/(#LUTs) + 40/(# of Slice Registers)  
    end //else begin
        //output_fc <=  input_fc*iweight_FC+ output_fc;
    //end
end

fpMul fmul(
.flp_a(input_fc),
.flp_b(iweight_FC),
.sign(output_tmp[31]),
.exponent(output_tmp[30:23]),
.prod(output_tmp[22:0]),
.clock(clk)
);

fp_add fadd(
.A_FP(output_fc),
.B_FP(output_tmp),
.sign(output_fc[31]),
.exponent(output_fc[30:23]),
.mantissa(output_fc[22:0]),
.clock(clk)
);
endmodule