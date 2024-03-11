`timescale 1ns / 1ns
// Shift Right Module
module alu_shr(xIn, xOut, shift);
    input [31:0] xIn;
    output [31:0] xOut;
    input wire [4:0] shift;
    
    assign xOut = xIn >> shift;
endmodule
