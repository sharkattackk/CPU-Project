module alu(
  input wire 	[31:0] Rb,
  input wire	[31:0] Ry,
  input AND, OR,
  output reg [31:0] resultLo
  );

  //declare each opcode as the operation name for readability

  //declare the output wires for each operation
  wire	[31:0] and_result, or_result;
  alu_and and_module(Rb, Ry, and_result);
  alu_or or_module(Rb, Ry, or_result);



  always @(*) begin
    if(AND)
        begin
          resultLo = and_result;
        end
	 else if(OR)
			begin
				resultLo = or_result;
			end
    end


    
endmodule 
