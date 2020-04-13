module fp_add (
input [31:0] A_FP, 
input [31:0] B_FP, 
output reg       sign, 
output reg [7:0] exponent, 
output reg [22:0] mantissa,
input clock);

//variables used in an always block
//are declared as registers
reg sign_a, sign_b,sign_c;
reg [7:0] e_A, e_B;
reg [23:0] fract_a, fract_b,fract_c;//frac = 1 . mantissa 
reg [7:0] shift_cnt;
reg cout;
reg shifted;
reg shifting;
wire clock;
always @ (A_FP or B_FP)
begin
    shifting = 0;
	sign_a  = A_FP [31];
	sign_b  = B_FP [31];
	e_A      = A_FP [30:23];
	e_B      = B_FP [30:23];
	fract_a  = {1'b1,A_FP [22:0]};
	fract_b  = {1'b1,B_FP [22:0]};
	//align fractions
	if (e_A < e_B)
    begin
	 shift_cnt  = e_B - e_A;
     fract_a   = fract_a >> shift_cnt;
     e_A  = e_A + shift_cnt;  
    end 
    
	if (e_B < e_A)
    begin
		shift_cnt  = e_A - e_B;
    	fract_b  = fract_b >> shift_cnt;
	   e_B  = e_B + shift_cnt;
   end 
	//add fractions
	if(sign_a==sign_b) begin
           sign  = sign_a;
	       {cout, fract_c}  = fract_a + fract_b;
	       if (cout)
               begin
                   {cout, fract_c}  = {cout, fract_c} >> 1;
                   e_B  = e_B + 1;
               end
         mantissa  = fract_c[22:0];
	 end else if(sign_a) begin
           {cout, fract_c}  =fract_b - fract_a;
           if(fract_a > fract_b) begin
                sign = 1'b1;
                fract_c = -fract_c;
            end else if(fract_a < fract_b)begin
                sign =1'b0;
                shifting=1'b1;
           end else
                sign=1'b0;
	 end else begin
	         {cout, fract_c}  =fract_a - fract_b;
             if(fract_b > fract_a) begin
                     sign = 1'b1;
                     fract_c = -fract_c;
                 end else if(fract_a > fract_b) begin
                     sign =1'b0;
                     shifting=1'b1;
                 end else
                    sign= 1'b0;
	 end
	//normalize result
	
	   exponent  = e_B;
end

always @ (posedge clock)
begin
    if(shifting ==1) begin
        if(fract_c[23] ==1) begin
            mantissa  = fract_c[22:0];
            shifting =0;
            exponent  = e_B;
            end
        fract_c = fract_c << 1;
        e_B=e_B-1'b1;
        
    end
end

endmodule
