module Reg32(input clr, clk, Rin, input[31:0] d, output reg[31:0] q);
    always @(posedge clk or posedge clr) 
    begin
		if(clr)
			q <= 32'h00000000;
		else if(Rin)
			q <= d;
		else
			q<= 32'h00000001;
	end
endmodule