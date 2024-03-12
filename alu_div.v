module alu_div(input [31:0] dividend, divisor, output reg [31:0] quotient, remainder);
    reg [31:0] m, q;       // Registers to store the current values of divisor and quotient
    reg [32:0] a;          // Register to store the intermediate result during division
	 reg [2:0] count;
    integer i;             // Integer variable for loop iteration

    always @ (*)
	 
    begin
			count = 0;
        // Initialize variables with input values
		  if(dividend[31] == 1)
				begin
					q= ~dividend + 1;
					count = count + 1;
				end
		  else
				begin
					q = dividend;
				end
		  if(divisor[31] == 1)
				begin
					m= ~divisor + 1;
					count = count + 1;
				end
			else 
				begin
					m = divisor;
				end
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
		  
		  if(count == 1)
				begin
					q = ~q + 1;
				end

        // Assign the final quotient to the output
        quotient = q;
		  
		  remainder = a;
    end
endmodule
