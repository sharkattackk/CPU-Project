module alu_mul(
    input [31:0] x,
    input [31:0] y,
    output reg [63:0] product
);

    reg [2:0] cc [15:0]; // Coefficients derived from 'y'
    reg [32:0] pp [15:0]; // Partial products
    reg [63:0] spp [15:0]; // Signed partial products
	 reg [63:0] prod; // Final product accumulator
    wire [31:0] inv_x; // Two's complement of 'x'
	 wire [31:0] neg_result;
	 alu_neg neg_module(x,y,neg_result);
	 assign inv_x = neg_result;

    integer kk, i; // Declare integer variables outside the procedural block

    always @* begin
        // Generate coefficients from 'y'
        cc[0] = {y[1], y[0], 1'b0};
        for (kk = 1; kk < 16; kk = kk + 1)
            cc[kk] = {y[2*kk+1], y[2*kk], y[2*kk-1]};

        // Generate partial products
        for (kk = 0; kk < 16; kk = kk + 1) begin 
            case (cc[kk])
                3'b001, 3'b010: pp[kk] = {x[31], x}; // Positive x
                3'b011: pp[kk] = {x, 1'b0}; // Shift left by 1
                3'b100: pp[kk] = {inv_x[31:0], 1'b0}; // Negative x
                3'b101, 3'b110: pp[kk] = inv_x; // Shift left by 1 and take two's complement
                default: pp[kk] = 0; // Default case
            endcase

            // Sign-extend and left shift the partial product
            spp[kk] = $signed(pp[kk]);
            for (i = 0; i < kk; i = i + 1) // Use the correct for-loop syntax
                spp[kk] = {spp[kk], 2'b00};
        end

        // Accumulate partial products to get the final product
        prod = spp[0];
        for (kk = 1; kk < 16; kk = kk + 1) 
			begin
            prod = prod + spp[kk];
			end
		// Output the final product
		  product <= prod;
    end
	 	  // Output the final product
		  //assign product = prod;

endmodule
