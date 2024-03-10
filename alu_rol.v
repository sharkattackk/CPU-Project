`timescale 1ns / 1ps



module alu_rol(
	input wire [31:0] Ra,
	input wire [31:0] Rb,
	output wire [31:0] Rz
	);
   assign Rz = (Ra << Rb[3:0]) | (Ra >> 32-Rb[3:0]);
endmodule