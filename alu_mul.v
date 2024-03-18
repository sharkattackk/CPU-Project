module alu_mul(
    input [31:0] x,
    input [31:0] y,
<<<<<<< HEAD
    output [63:0] product
=======
    output reg [63:0] product
>>>>>>> main
);

    reg [2:0] cc [15:0]; // Coefficients 
    reg [32:0] pp [15:0]; // Partial products
    reg [63:0] spp [15:0]; // Signed partial products
	 reg [63:0] prod; // Final product 
    wire [31:0] twos_x; // Two's complement of 'x'
	 wire [31:0] neg_result;
	 alu_neg neg_module(x,y,neg_result);
	 assign twos_x = neg_result;

    integer k, i; 

    always @* 
        begin
            // Coefficients from y
            cc[0] = {y[1], y[0], 1'b0};
            for (k = 1; k < 16; k = k + 1)
                cc[k] = {y[2*k+1], y[2*k], y[2*k-1]};

            // Generate partial products
            for (k = 0; k < 16; k = k + 1) begin 
                case (cc[k])
                    3'b001, 3'b010: pp[k] = {x[31], x}; // Positive x
                    3'b011: pp[k] = {x, 1'b0}; // Shift left by 1
                    3'b100: pp[k] = {twos_x[31:0], 1'b0}; // Negative x
                    3'b101, 3'b110: pp[k] = twos_x; // Shift left by 1 and take two's complement
                    default: pp[k] = 0; // Default case
                endcase

                // Sign-extend and shift the partial product left
                spp[k] = $signed(pp[k]);
                for (i = 0; i < k; i = i + 1)
                    spp[k] = {spp[k], 2'b00};
            end

            // Sum partial products to get the final product
            prod = spp[0];
            for (k = 1; k < 16; k = k + 1) 
                begin
                prod = prod + spp[k];
                end
            // Output the final product
            product <= prod;
        end


endmodule
