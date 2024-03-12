module Reg32(input clr, clk, Rin, input[31:0] d, output reg[31:0] q);
    always @*
		begin
			if(clr)
				q <= 32'h00000000;
			else if(Rin)
				q <= d;
		end
endmodule