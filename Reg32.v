module Reg32(input clr, clk, en, input[31:0] d, output reg[31:0] q);
    always @*
		begin
			if(clr)
				q <= 32'h00000000;
			else if(en)
				q <= d;
		end
endmodule