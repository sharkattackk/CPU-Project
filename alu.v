module alu(
  input wire 	[31:0] Rb,
  input wire	[31:0] Ry,
<<<<<<< HEAD
  input wire clk,
  input AND, OR, NEG, NOT, MUL, ROL, ROR, DIV,
=======
  input AND, OR, NEG, NOT, SUB, ADD, MUL, ROR, ROL, DIV, SHR, SHL, SHRA,
>>>>>>> main
  output reg [31:0] resultLo, resultHi
  );

  //declare each opcode as the operation name for readability

  //declare the output wires for each operation
<<<<<<< HEAD
  wire	[31:0] and_result, or_result, neg_result, not_result, rol_result, ror_result;
  wire   [63:0] mul_result, div_result;
  assign mul_result = {resultLo, resultHi};
  assign di_result = {resultLo, resultHi};
=======
  wire	[31:0] and_result, or_result, neg_result, not_result, sub_result, add_result, ror_result, rol_result, shr_result, shl_result, shra_result, div_quotient, div_remainder;
  wire [63:0] mul_result;
  wire [32:0] carryOut;
  
>>>>>>> main
  alu_and and_module(Rb, Ry, and_result);
  alu_or or_module(Rb, Ry, or_result);
  alu_neg neg_module(Rb, Ry, neg_result);
  alu_not not_module(Rb, Ry, not_result);
<<<<<<< HEAD
  alu_mul mul_module(Rb, Ry, mul_result);
  alu_rol rol_module(Rb, Ry, rol_result);
  alu_ror ror_module(Rb, Ry, ror_result);
  alu_div div_module(Rb, Ry, div_result);
=======
  alu_sub sub_module(sub_result, carryOut, Ry, Rb);
  alu_add add_module(add_result, carryOut, Ry, Rb);
  alu_mul mul_module(Rb, Ry, mul_result);
  alu_ror ror_module(Ry, Rb, ror_result);
  alu_rol rol_module(Ry, Rb, rol_result);
  alu_div div_module(Rb, Ry, div_quotient, div_remainder);
  alu_shr shr_module(Ry, shr_result, Rb);
  alu_shl shl_module(Ry, shl_result, Rb);
  alu_shra shra_module(Ry, Rb, shra_result);
>>>>>>> main



  always @(*) 
    begin
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
                resultLo = div_quotient;
                resultHi = div_remainder;
            end
        else if(ROR)
            begin
                resultLo = ror_result;
            end
        else if(ROL)
            begin
                resultLo = rol_result;
            end
        else if(SHR)
            begin
                resultLo = shr_result;
            end
        else if(SHL)
            begin
                resultLo = shl_result;
            end
        else if(SHRA)
            begin
                resultLo = shra_result;
            end
    end

endmodule 
