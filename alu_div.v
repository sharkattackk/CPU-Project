module alu_div(input [31:0] dividend, divisor, output reg [31:0] quotient, remainder);
<<<<<<< HEAD
    reg [31:0] m, q;       // Divisor and Dividend registers
    reg [32:0] a;          // Accumulator
	reg [2:0] count;       // Count to determine if result will be pos or neg
    integer i;            

    always @*
=======
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
>>>>>>> 23adbdecb47701b7b53b1a2354684b8b4fe5d33a
        begin
            count = 0;
            if(dividend[31] == 1)
                begin
                    q= ~dividend + 1;
                    count = count + 1;
                end
            else
<<<<<<< HEAD
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
=======
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
>>>>>>> 23adbdecb47701b7b53b1a2354684b8b4fe5d33a

            for(i = 0; i < 32; i = i+1)
                begin
                    a = {a[30:0], q[31]}; // Shift a left by one and place q's MSB in the LSB of a
                    q[31:1] = q[30:0]; // Shift q by 1 to the left
                    // Subtract a from m
                    a = a - m;

                    // If MSB of a is pos then set LSB of q to 1
                    // else MSB of a is negative so set q to 0 and add Divisor to Accumulator
                    if(a[31] == 0)
                        begin
                            q[0] = 1;
                        end
                    else
                        begin
                            q[0] = 0;
                            a = a + m;
                        end
                end
            
            // if Count is 1 that means one of either the divisor or dividend was negative thus the result will be negative
            // necessary to re-do the twos complement
            if(count == 1)
                begin
                    q = ~q + 1;
                end

            quotient = q;
            remainder = a;
        end
endmodule