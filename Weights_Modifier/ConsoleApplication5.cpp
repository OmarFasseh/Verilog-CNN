//This program from GeeksforGeeks

// C program to convert a real value 
// to IEEE 754 floating point representaion 

#include <stdio.h>
#include <iostream>
#include <stdio.h>
#include <string>
#include <vector>
#define num_of_weights 1
using namespace std;



void printBinary(int n, int i)
{

	// Prints the binary representation 
	// of a number n up to i-bits. 
	int k;
	for (k = i - 1; k >= 0; k--) {

		if ((n >> k) & 1)
			printf("1");
		else
			printf("0");
	}
}

typedef union {

	float f;
	struct
	{

		// Order is important. 
		// Here the members of the union data structure 
		// use the same memory (32 bits). 
		// The ordering is taken 
		// from the LSB to the MSB. 
		unsigned int mantissa : 23;
		unsigned int exponent : 8;
		unsigned int sign : 1;

	} raw;
} myfloat;

// Function to convert real value 
// to IEEE foating point representation 
long int getIEEE(myfloat var)
{
	long int binaryval = 0;
	binaryval = (long int)var.raw.sign << 31 | (long int)var.raw.exponent << 23 | (long int)var.raw.mantissa;
	return binaryval;
}


// Driver Code 
int main()
{
	vector<string> files_read;
	vector<string> files_write;
	for (int i = 1; i <= num_of_weights; i++)
	{
		string name1 = "weights";
		string name2 = "weights";
		name1.append(to_string(i));
		name2.append(to_string(i));
		name2.append("_modified.txt");
		name1.append(".txt");
		files_read.push_back(name1);
		files_write.push_back(name2);
	}
	for (int i = 0; i < files_read.size(); i++)
	{
		string f_name = files_read[i];
		string f_name_write = files_write[i];

		FILE *fptr = fopen(f_name.c_str(), "r");
		FILE *fwrt = fopen(f_name_write.c_str(), "w");
		// Instantiate the union 
		myfloat var;
		float tst;
		// Get the real value 
		while (fscanf(fptr, "%f", &tst)!=EOF)
		{
			var.f = tst;
			long int n = getIEEE(var);
			fprintf(fwrt, "%x\n", n);
		}
		fclose(fptr);
		fclose(fwrt);
	}
	return 0;
}