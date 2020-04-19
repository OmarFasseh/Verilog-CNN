module weights_Memory (clk,address_fc,read_en_MM_fc ,dataMainMemo_fc,enable_MM_out_fc) ;
parameter DATA_WIDTH = 32;//16 ;
parameter ADDR_WIDTH = 9 ;
parameter parallel_fc_PE=32;
parameter fc_columns     =100; //9216;
parameter tot_weight_size=3200;//92164096;
input clk;
input [ADDR_WIDTH-1:0]          address_fc;
input       read_en_MM_fc,enable_MM_out_fc;
output  reg [(DATA_WIDTH*parallel_fc_PE-1):0]    dataMainMemo_fc;

parameter file = "E:/trashCan/a.txt";

reg signed    [DATA_WIDTH-1:0] mem [0:tot_weight_size-1] ;
integer k;

always @(negedge clk )
begin
    for(k=0;k < parallel_fc_PE;k=k+1)
    begin
        if (enable_MM_out_fc)
             dataMainMemo_fc[k*DATA_WIDTH+:DATA_WIDTH] <= read_en_MM_fc ? mem[fc_columns*k+address_fc] : 32'b0;
        else 
             dataMainMemo_fc[k*DATA_WIDTH+:DATA_WIDTH]<=8192'bZ;
    end
    //$stop;
end

initial begin
  $readmemh(file, mem); // memory_list is     ory file


end

endmodule