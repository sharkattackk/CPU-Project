module alu(
  input wire 	[31:0] Rb,
  input wire	[31:0] Ry,
  input AND,
  output reg [31:0] resultLo
  );

  //declare each opcode as the operation name for readability

  //declare the output wires for each operation
  wire	[31:0] and_result;
  alu_and and_module(Rb, Ry, and_result);



  always @(*) begin
    if(AND)
        begin
          resultLo = and_result;
        end
    end


    
endmodule 
