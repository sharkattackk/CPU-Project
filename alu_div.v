<<<<<<< HEAD
//Restoring Division

module alu_div(
  input wire signed [31:0] a,
  input wire signed [31:0] b,

  output wire signed [63:0] quotient
);


reg signed [31:0] A;
reg signed [31:0] Q;
integer i;

always @(a, b) begin
  A = 0; 
  Q = a;
    
  for (i = 0; i < 32; i = i + 1) begin
    A = { A[31:0], Q[31] };
    Q = Q << 1;
	
    A = A - b;
	 
    if (A < 0)begin
      A = A + b;
    end else begin
      Q[0] = 1;
    end
  end
end

assign quotient[31:0] = Q;
assign quotient[63:32] = A;

endmodule
=======
module alu_div(input [31:0] dividend, divisor, output reg [31:0] quotient, remainder);
    reg [31:0] m, q;       // Registers to store the current values of divisor and quotient
    reg [32:0] a;          // Register to store the intermediate result during division
    integer i;             // Integer variable for loop iteration

    always @ (*)
    begin
        // Initialize variables with input values
        q = dividend;
        m = divisor;
        a = 0;

        // Perform the division
        for(i = 0; i < 32; i = i+1)
        begin
            // Shift left the current a and append the most significant bit of q
            a = {a[30:0], q[31]};
            // Shift right the current q
            q[31:1] = q[30:0];
            // Subtract m from a
            a = a - m;

            // Check if the result is positive (MSB of a is 0)
            if(a[31] == 0)
            begin
                // If non-negative, set the LSB of q to 1
                q[0] = 1;
            end
            else
            begin
					 // If negative, set the LSB of q to 0 and add m back to a
                q[0] = 0;
                a = a + m;
            end
        end

        // Assign the final quotient to the output
        quotient = q;
		  
		  remainder = a;
    end
endmodule
>>>>>>> main
