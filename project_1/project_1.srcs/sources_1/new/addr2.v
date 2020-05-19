module fp_add_2 (
input [31:0] A_FP, 
input [31:0] B_FP,
input clk, 
output reg       sign, 
output reg	done,
output reg [7:0] exponent, 
output reg [22:0] mantissa);

//variables used in an always block
//are declared as registers
reg sign_a, sign_b,sign_c;
reg [7:0] e_A, e_B;
reg [23:0] fract_a, fract_b,fract_c;//frac = 1 . mantissa 
reg [7:0] shift_cnt;
reg cout;
reg [7:0] tmp_e;
reg [23:0] tmp_fract;
reg tmp_sign;
reg [5:0] i;

always @ (negedge clk)
begin
	sign_a  = A_FP [31];
	sign_b  = B_FP [31];
	e_A      = A_FP [30:23];
	e_B      = B_FP [30:23];
	fract_a  = {1'b1,A_FP [22:0]};
	fract_b  = {1'b1,B_FP [22:0]};
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
	sign = sign_a;
	if(sign_a != sign_b)
	begin
		if(fract_b > fract_a) begin
			sign = sign_b;
		end
	end else if(cout) begin
		fract_c = fract_c >> 1; //If there's carry, then shift
		e_B = e_B + 1; //Increment exponent as we shifted
	end
		

	if(fract_a == fract_b && sign_a != sign_b) begin // handel the case of zero 
        sign= 1'b0;
        e_B = 0;
        fract_c[23] = 1; //the one will be removed
        fract_c[22:0] = 22'b0;
    end
    //normalize result
    //get index of first 1
	for(i = 0; i < 23 && fract_c[23-i]==0; i=i+1) begin
    end
	fract_c = fract_c << i;
    e_B = e_B-i;


    mantissa = fract_c[22:0];
    exponent = e_B; 
	done = 1;
end

always @(posedge clk)
	done = 0;
endmodule
