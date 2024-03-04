module alu(
  input wire 	[31:0] Rb,
  input wire	[31:0] Ry,
  input AND, OR, NEG, NOT, SUB, ADD, MUL, ROR, DIV, SHR, SHL,
  output reg [31:0] resultLo, resultHi
  );

  //declare each opcode as the operation name for readability

  //declare the output wires for each operation
  wire	[31:0] and_result, or_result, neg_result, not_result, sub_result, add_result, ror_result, shr_result, shl_result;
  wire [63:0] mul_result, div_result;
  wire [32:0] carryOut;
  
  alu_and and_module(Rb, Ry, and_result);
  alu_or or_module(Rb, Ry, or_result);
  alu_neg neg_module(Rb, Ry, neg_result);
  alu_not not_module(Rb, Ry, not_result);
  alu_sub sub_module(sub_result, carryOut, Ry, Rb);
  alu_add add_module(add_result, carryOut, Ry, Rb);
  alu_mul mul_module(Rb, Ry, mul_result);
  alu_ror ror_module(Rb, Ry, ror_result);
  alu_div div_module(Rb, Ry, div_result);
  SHR shr_module(Ry, shr_result, Rb);
  SHL shl_module(Ry, shl_result, Rb);



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
	 else if(SUB)
        begin  
            resultLo = sub_result;
        end
	 else if(ADD)
        begin  
            resultLo = add_result;
        end
	 else if(MUL)
		begin
			resultLo = mul_result[31:0];
			resultHi = mul_result[63:32];
		end
	 else if(ROR)
		begin
			resultLo = ror_result;
		end
	 else if(DIV)
		begin
			resultLo = div_result[31:0];
			resultHi = div_result[63:32];
		end
	 else if(SHR)
		begin
			resultLo = shr_result;
		end
	 else if(SHL)
		begin
			resultLo = shl_result;
		end
    end


    
endmodule 
