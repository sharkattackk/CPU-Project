//Restoring Division

module alu_div(
  input [31:0] a,
  input [31:0] b,

  output reg [63:0] quotient
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
  quotient[31:0] = Q;
  quotient[63:32] = A;
end



endmodule