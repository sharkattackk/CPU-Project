module alu_neg(
	input wire [31:0] a,
	input wire [31:0] b,
	output wire [31:0] result
	);
	//converts to two's complement negative form by inverting all bits and adding 1
	assign result = ~a +1;
	
	
	
endmodule 