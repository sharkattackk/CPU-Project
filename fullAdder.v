module FullAdder (X, Y, Cin, Cout, Sum);
	input X; 
	input Y; 
	input Cin;
	output Cout;
	output Sum;
	
	assign Sum = X ^ Y ^ Cin;
	assign Cout = (X & Y) | (X & Cin) | (Y & Cin);
endmodule