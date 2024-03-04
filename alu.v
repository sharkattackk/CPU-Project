module alu(
  input wire 	[31:0] Rb,
  input wire	[31:0] Ry,
  input wire clk,
  input AND, OR, NEG, NOT, MUL, ROL, ROR, DIV,
  output reg [31:0] resultLo, resultHi
  );

  //declare each opcode as the operation name for readability

  //declare the output wires for each operation
  wire	[31:0] and_result, or_result, neg_result, not_result, rol_result, ror_result;
  wire   [63:0] mul_result, div_result;
  assign mul_result = {resultLo, resultHi};
  assign di_result = {resultLo, resultHi};
  alu_and and_module(Rb, Ry, and_result);
  alu_or or_module(Rb, Ry, or_result);
  alu_neg neg_module(Rb, Ry, neg_result);
  alu_not not_module(Rb, Ry, not_result);
  alu_mul mul_module(Rb, Ry, mul_result);
  alu_rol rol_module(Rb, Ry, rol_result);
  alu_ror ror_module(Rb, Ry, ror_result);
  alu_div div_module(Rb, Ry, div_result);



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
    else if(NOT)
        begin  
            resultLo = not_result;
        end
	 else if(MUL)
        begin  
            resultLo <= mul_result[31:0];
				resultHi <= mul_result[63:32];
        end
	else if(DIV)
        begin  
            resultLo <= div_result[31:0];
				resultHi <= div_result[63:32];
        end
	else if(ROL)
        begin  
            resultLo = rol_result;
        end
	else if(ROR)
        begin  
            resultLo = ror_result;
        end
    end


    
endmodule 
