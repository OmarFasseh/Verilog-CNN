`timescale 1ns / 1ps
//ieee divider module
module fpDiv(flp_a,
flp_b,
sign,
exponent,
div,
clk,
div_reset,
div_done,
div_start
);

parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;

//regs and wires
wire [EXPONENT_WIDTH+MANTISSA_WIDTH:0] flp_a, flp_b;
wire clk, div_reset,div_start;

reg sign;
reg [EXPONENT_WIDTH-1:0] exponent;
reg [EXPONENT_WIDTH-1:0] exp_sub;
reg [(MANTISSA_WIDTH)-1:0] div;
reg div_done;
//size is 50bit 49:0
reg [2*(MANTISSA_WIDTH+1)+1:0] recMantissa;
reg [2*(MANTISSA_WIDTH+1)+1:0] NMantissa;
reg [2*(MANTISSA_WIDTH+1)+1:0] DMantissa;

//inputs and outputs
input flp_a, flp_b ,clk, div_reset,div_start;
output div, exponent, sign,div_done ;
integer i;
/*initial
begin
i=0;
$stop;
end*/
always @ (negedge clk && div_start) 
begin  
if(i==6)
begin
   if (NMantissa[MANTISSA_WIDTH-1]==1) //If we had a carry, then deccrement exponent
   begin 
      NMantissa=NMantissa+1; 
   end 
   else
   begin
   end
  //normalize
    div=0;
    if( NMantissa[23] ==1) 
    begin
      div = NMantissa[22:0];
    end 
    
    exponent = exp_sub[EXPONENT_WIDTH-1:0];
    //zero input
    if(flp_a[MANTISSA_WIDTH-1:0]==0) 
    begin
        div=0;
        exponent=0;
        sign=0;
    end  
    else
    begin
    end
    div_done=1; 
     NMantissa = 0;
      DMantissa = 0;
      recMantissa=0;
      i=0;
 //     $stop;
  end
  else
  begin
  end
end

always @ (posedge clk && i<=5 && div_start) 
begin  

    if(i==1)
    begin
       sign = flp_a[EXPONENT_WIDTH+MANTISSA_WIDTH] ^ flp_b[EXPONENT_WIDTH+MANTISSA_WIDTH];
       exp_sub = flp_a[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]-flp_b[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]+(2**(EXPONENT_WIDTH-1)-1); 
       NMantissa={2'b01,flp_a[MANTISSA_WIDTH-1:0]};
       DMantissa={2'b01,flp_b[MANTISSA_WIDTH-1:0]};
       recMantissa={2'b01,flp_b[MANTISSA_WIDTH-1:0]} >>2;
    end
    else
    begin
    end
  NMantissa = recMantissa * NMantissa;
  NMantissa = NMantissa >> 23; //most 25 bit is the important
  DMantissa = recMantissa * DMantissa;
  DMantissa =DMantissa >> 23;
  recMantissa=25'b10_000_0000_0000_0000_0000_0000-DMantissa[MANTISSA_WIDTH+1:0]; //2-D[24:0]
  
  i=i+1;
  //$stop;
end

always @ (posedge div_reset) 
begin
   NMantissa = 0;
   DMantissa = 0;
   recMantissa=0;
   i=0;
   div_done=0;
  //$stop;
end
endmodule