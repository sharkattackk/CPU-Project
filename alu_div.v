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
    reg [31:0] m, q;       // Divisor and Dividend registers
    reg [32:0] a;          // Accumulator
	reg [2:0] count;       // Count to determine if result will be pos or neg
    integer i;            

    always @*
        begin
            count = 0;
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