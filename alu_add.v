module alu_add(Sum, cOut, A, B);
	input [31:0] A, B;
	output [31:0] Sum;
	output cOut;

	wire [32:0] carry; // Internal carry wires
	assign carry[0] = 1'b0;
	genvar i;
	generate
	  for (i = 0; i < 32; i = i + 1) 
	  	begin : gen_loop
			FullAdder FullAdder0(.Sum(Sum[i]), .Cout(carry[i + 1]), .X(A[i]), .Y(B[i]), .Cin(carry[i]));
	  	end
	endgenerate

endmodule