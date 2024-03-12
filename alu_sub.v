module alu_sub(Sum, cOut, A, B);
	input [31:0] A, B;
	output [31:0] Sum;
	output cOut;
	wire [31:0] twosB;
	
	assign twosB = ~B + 1;
	
	wire [32:0] carry; // Internal carry wires
	assign carry[0] = 1'b0;
	genvar i;
	generate
	  for (i = 0; i < 32; i = i + 1) 
	  	begin : gen_loop
			FullAdder FullAdder0(.Sum(Sum[i]), .Cout(carry[i + 1]), .X(A[i]), .Y(twosB[i]), .Cin(carry[i]));
	  	end
	endgenerate

endmodule
