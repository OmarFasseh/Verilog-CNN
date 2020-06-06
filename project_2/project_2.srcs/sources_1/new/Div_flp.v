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

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;

//regs and wires
wire [EXPONENT_WIDTH+MANTISSA_WIDTH:0] flp_a, flp_b;
wire clk, div_reset,div_start;

reg sign;
reg [EXPONENT_WIDTH-1:0] exponent;
reg [EXPONENT_WIDTH-1:0] exp_sub;
reg [(MANTISSA_WIDTH)-1:0] div;
reg div_done;
//size is data width *2 (for multiplication)
reg [2*(MANTISSA_WIDTH+1)+1:0] recMantissa;
reg [2*(MANTISSA_WIDTH+1)+1:0] NMantissa;
reg [2*(MANTISSA_WIDTH+1)+1:0] DMantissa;

//inputs and outputs
input flp_a, flp_b ,clk, div_reset,div_start;
output div, exponent, sign,div_done ;
integer i;

always @ (negedge clk && div_start) 
begin  
if(i==6)
begin
   //Handel error from division algorithm (roundup)
   if(NMantissa[MANTISSA_WIDTH-1:MANTISSA_WIDTH-4]==4'b1111)
   begin
       NMantissa=0;
       NMantissa[MANTISSA_WIDTH]=1; 
   end
   else
   begin
   end
   
   //underflow, then deccrement exponent
   if (NMantissa[MANTISSA_WIDTH]==0) 
   begin 
      exp_sub[EXPONENT_WIDTH-1:0]=exp_sub[EXPONENT_WIDTH-1:0]-1; 
   end 
   else
   begin
   end

  //Normalize and set div (mantissa) output
    div=0;
    if( NMantissa[MANTISSA_WIDTH] ==1) 
    begin
      div = NMantissa[MANTISSA_WIDTH-1:0];
    end 
    else if(NMantissa[MANTISSA_WIDTH-1] ==1)
    begin
     div = NMantissa[MANTISSA_WIDTH-2:0];
     div=div<<1;
    end 
    else
    begin
    end
    
    //Set exponent output
    exponent = exp_sub[EXPONENT_WIDTH-1:0];

    //Roundup answers (To cancel error in div of mantissa)
    if(div[MANTISSA_WIDTH-2:MANTISSA_WIDTH-5]==4'b1111)
    begin
    div=10'b10_0000_0000;
    end
    else if(div[MANTISSA_WIDTH-3:MANTISSA_WIDTH-6]==4'b1111)
    begin
    div=10'b01_0000_0000;
    end
    else
    begin
    end
    
    //zero input A
    if(flp_a[MANTISSA_WIDTH+EXPONENT_WIDTH-1:0]==0) 
    begin
        div=0;
        exponent=0;
        sign=0;
    end  
    else
    begin
    end
    
    // handel zero matissa for multiple of 2
    if(flp_a[MANTISSA_WIDTH-1:0]==0 && flp_b[MANTISSA_WIDTH-1:0]==0)
    begin
            div=0;
    end
    else
    begin
    end
    
    // Mark done flage and reset reg.s
    div_done=1; 
    NMantissa = 0;
    DMantissa = 0;
    recMantissa=0;
    i=0;
  end
  else
  begin
  end
end

// Using goldshmidt algorithm for 5 iterations
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
  NMantissa = NMantissa >> MANTISSA_WIDTH; //most bits is the important
  DMantissa = recMantissa * DMantissa;
  DMantissa =DMantissa >> MANTISSA_WIDTH; //most bits is the important
  
  //case 32bit uncomment the next line
 // recMantissa=25'b10_000_0000_0000_0000_0000_0000-DMantissa[MANTISSA_WIDTH+1:0]; //2-D[24:0]
  recMantissa=12'b10_00_0000_0000-DMantissa[MANTISSA_WIDTH+1:0]; //2-D[11:0]

  i=i+1;
end

// Reset reg.s and counters
always @ (posedge div_reset) 
begin
   NMantissa = 0;
   DMantissa = 0;
   recMantissa=0;
   i=0;
   div_done=0;
end
endmodule