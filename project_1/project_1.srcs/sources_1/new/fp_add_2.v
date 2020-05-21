module fp_add_2 (
input [EXPONENT_WIDTH+MANTISSA_WIDTH:0] A_FP, 
input [EXPONENT_WIDTH+MANTISSA_WIDTH:0] B_FP,
input clk, 
output reg       sign, 
output reg	done,
output reg [EXPONENT_WIDTH-1:0] exponent, 
output reg [MANTISSA_WIDTH-1:0] mantissa);

parameter EXPONENT_WIDTH = 8;
parameter MANTISSA_WIDTH = 23;

//variables used in an always block
//are declared as registers
reg sign_a, sign_b,sign_c;
reg [EXPONENT_WIDTH-1:0] e_A, e_B;
reg [MANTISSA_WIDTH:0] fract_a, fract_b,fract_c;//frac = 1 . mantissa 
reg [EXPONENT_WIDTH-1:0] shift_cnt;
reg cout;
reg [EXPONENT_WIDTH-1:0] tmp_e;
reg [MANTISSA_WIDTH:0] tmp_fract;
reg tmp_sign;
reg [5:0] i;

always @ (negedge clk)
begin
	sign_a  = A_FP [EXPONENT_WIDTH+MANTISSA_WIDTH];
	sign_b  = B_FP [EXPONENT_WIDTH+MANTISSA_WIDTH];
	e_A      = A_FP [EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH];
	e_B      = B_FP [EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH];
	fract_a  = {1'b1,A_FP [MANTISSA_WIDTH-1:0]};
	fract_b  = {1'b1,B_FP [MANTISSA_WIDTH-1:0]};
	
	//if e_A is smaller, swap the two numbers
	if(e_A < e_B)
	begin
		tmp_e = e_B;
		e_B = e_A;
		e_A = tmp_e;

		tmp_fract = fract_b;
		fract_b = fract_a;
		fract_a = tmp_fract;

		tmp_sign = sign_b;
		sign_b = sign_a;
		sign_a = tmp_sign;
	end
	//e_B is always smaller than or equal to e_A as we swap them
	if (e_B < e_A)
    begin  
	 shift_cnt  = e_A - e_B;
     fract_b   = fract_b >> shift_cnt;
     e_B = e_A;  
    end
 

	//if it is subtraction (sign_a != sign_b) then get 2's complement of smaller fract
	if(sign_a != sign_b)
	begin
		if(fract_a > fract_b) begin
			fract_b = -fract_b;
		end else begin 
			fract_a = -fract_a;
		end
	end
	
	//add fractions
	{cout, fract_c}  = fract_a + fract_b;

	//Start determining sign
	sign = A_FP[MANTISSA_WIDTH+EXPONENT_WIDTH]; //Use input not fract nor sign as we might have swapped them
	if(sign_a != sign_b)
	begin
		if(B_FP[MANTISSA_WIDTH+EXPONENT_WIDTH-1:0] > A_FP[MANTISSA_WIDTH+EXPONENT_WIDTH-1:0]) begin
			sign = B_FP[MANTISSA_WIDTH+EXPONENT_WIDTH];
		end
	end else if(cout) begin
		{cout, fract_c}  = {cout, fract_c} >> 1; //If there's carry, then shift
		e_B = e_B + 1; //Increment exponent as we shifted
	end
		

	if(A_FP[MANTISSA_WIDTH-1:0] == B_FP[MANTISSA_WIDTH-1:0] && A_FP[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH] == B_FP[EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH] && sign_a != sign_b) begin //If A = -B, answer is zero
        sign= 1'b0;
        e_B = 0;
        fract_c[MANTISSA_WIDTH] = 1; //the one will be removed
        fract_c[MANTISSA_WIDTH-1:0] = 0;
    end

    //normalize result
    //get index of first 1
	for(i = 0; i < MANTISSA_WIDTH && fract_c[MANTISSA_WIDTH-i]==0; i=i+1) begin
    end
	fract_c = fract_c << i;
    e_B = e_B-i;


    mantissa = fract_c[MANTISSA_WIDTH-1:0];
    exponent = e_B; 
	//If one of the inputs is zero or negative zero
	if(A_FP[MANTISSA_WIDTH+EXPONENT_WIDTH-1:0] == 0) begin
		mantissa = B_FP[MANTISSA_WIDTH-1:0];
		sign = B_FP[EXPONENT_WIDTH+MANTISSA_WIDTH];
		exponent = B_FP [EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH];
	end else if(B_FP[MANTISSA_WIDTH+EXPONENT_WIDTH-1:0] == 0) begin
		mantissa = A_FP[MANTISSA_WIDTH-1:0];
		sign = A_FP[EXPONENT_WIDTH+MANTISSA_WIDTH];
		exponent = A_FP [EXPONENT_WIDTH+MANTISSA_WIDTH-1:MANTISSA_WIDTH];
	end
	done = 1;
end

always @(posedge clk)
	done = 0;
endmodule
