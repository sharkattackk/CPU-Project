module alu(
  input wire 	[31:0] Rb,
  input wire	[31:0] Ry,
  input AND, OR, NEG,
  output reg [31:0] resultLo
  );

  //declare each opcode as the operation name for readability

  //declare the output wires for each operation
  wire	[31:0] and_result, or_result, neg_result;
  alu_and and_module(Rb, Ry, and_result);
  alu_or or_module(Rb, Ry, or_result);
  alu_neg neg_module(Rb, Ry, neg_result);



  always @(*) begin
    if(AND)
        begin
          resultLo = and_result;
        end
	 else if(OR)
			begin
				resultLo = or_result;
			end
    else if(NEG)
        begin
            resultLo = neg_result;
        end
    end


    
endmodule 
