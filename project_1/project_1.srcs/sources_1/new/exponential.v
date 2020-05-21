module exponential ( input_exp,clk,output_exp);
parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
input [DATA_WIDTH-1:0]       input_exp ;
input clk ;
output reg[DATA_WIDTH-1:0] output_exp ;
wire [DATA_WIDTH-1:0] output_tmp_mul;
wire [DATA_WIDTH-1:0] output_tmp_add;

reg [4:0] x;
reg [4:0] i;
wire done;
reg [(DATA_WIDTH-1):0] const_OneSix=32'b00111110001010101010101010101011;
reg [(DATA_WIDTH-1):0] const_OneFifths=32'b00111110010011001100110011001101;
reg [(DATA_WIDTH-1):0] const_OneQuarter=32'b00111110100000000000000000000000;
reg [(DATA_WIDTH-1):0] const_OneThird=32'b00111110101010101010101010101011;
reg [(DATA_WIDTH-1):0] const_Half=32'b00111111000000000000000000000000;
reg [(DATA_WIDTH-1):0] const_One=32'b00111111100000000000000000000000;
reg [DATA_WIDTH-1:0] input_one;
reg [DATA_WIDTH-1:0] input_two;
wire [DATA_WIDTH-1:0] output_const;
reg [DATA_WIDTH-1:0] input_adder;


initial
begin
    i=0;
   // $stop;
end
always@ (posedge clk)
begin
    if(i==0)
    begin
        input_one=const_OneSix;  
        input_two=input_exp;
    end
    else if(i%2==1)
    begin
        input_one=output_tmp_add;  
        input_two=input_exp;
    end
    else
    begin
        input_one=output_tmp_add;  
        if(i==2)
        begin
             input_two=const_OneFifths;
        end
        else if(i==4)
        begin
             input_two=const_OneQuarter;
        end
        else if(i==6)
        begin
             input_two=const_OneThird;
        end
        else if(i==8)
        begin
             input_two=const_Half;
        end
        else
        begin
        end
    end
  //  $stop;
end
always@ (negedge clk)
begin
    if(i==0 || i==9)
    begin
         input_adder=const_One;  
    end
    else if(i%2==0)
    begin
       input_adder=const_One;  
    end
    else
            input_adder=32'h00000000000000000000000000000000;
    begin
    end
    
    if(i!=10)
    begin
      i=i+1;
    end
    else
    begin
    end
 //   $stop;
end

always@ (posedge done && i==10)
begin
        output_exp=output_tmp_add;
        i=0;
end



fpMul #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) fmul(
.flp_a(input_one),
.flp_b(input_two),
.sign(output_tmp_mul[EXPONENT_WIDTH+MANTISSA_WIDTH]),
.exponent(output_tmp_mul[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]),
.prod(output_tmp_mul[MANTISSA_WIDTH-1:0]),
.clk(clk)
);

fp_add_2 #(.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) fadd(
.A_FP(input_adder),
.B_FP(output_tmp_mul),
.sign(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH]),
.exponent(output_tmp_add[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH]),
.mantissa(output_tmp_add[MANTISSA_WIDTH-1:0]),
.clk(clk),
.done(done)
);
endmodule