module datapath( input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
				 input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
				 input wire PCin, PCout, IRin, Yin, Zin, MARin, MDRin, MDRout, HIin, HIout, LOin, LOout, IncPC, Zhighout, Zlowout, Read, 
				 input AND, OR, NEG, NOT, InPortout, Cout, 
				 input [31:0] MDatain,
				 input wire clk, clr
               );

                reg [15:0] enable;
                reg [15:0] Rout;

                initial begin
                    Rout = 16'b0;
                    enable = 16'b0;
                end
                
                always @* begin
                    enable[2] = R2in;
                    enable[3] = R3in;
                    enable[1] = R1in;
                    Rout[3] = R3out;
                    Rout[2] = R2out;
                end

                wire [31:0] BusMuxIn_IR, BusMuxIn_Y, C_sign_extend, BusMuxIn_InPort, BusMuxIn_MDR, BusMuxIn_PC, BusMuxIn_ZLO, BusMuxIn_ZHI, BusMuxIn_LO, BusMuxIn_HI;
                wire [31:0] BusMuxIn_R15, BusMuxIn_R14, BusMuxIn_R13, BusMuxIn_R12, BusMuxIn_R11, BusMuxIn_R10, BusMuxIn_R9, BusMuxIn_R8, BusMuxIn_R7, BusMuxIn_R6, BusMuxIn_R5, BusMuxIn_R4, BusMuxIn_R3, BusMuxIn_R2, BusMuxIn_R1, BusMuxIn_R0;					 wire [31:0] bus_signal;
                wire [31:0] C_data_out;
                wire [31:0] BusMuxOut;


                Reg32 R0(.clr(clr), .clk(clk), .Rin(R0in), .d(BusMuxOut), .q(BusMuxIn_R0));
				Reg32 R1(.clr(clr), .clk(clk), .Rin(R1in), .d(BusMuxOut), .q(BusMuxIn_R1));
				Reg32 R2(.clr(clr), .clk(clk), .Rin(R2in), .d(BusMuxOut), .q(BusMuxIn_R2));
				Reg32 R3(.clr(clr), .clk(clk), .Rin(R3in), .d(BusMuxOut), .q(BusMuxIn_R3));
				Reg32 R4(.clr(clr), .clk(clk), .Rin(R4in), .d(BusMuxOut), .q(BusMuxIn_R4));
				Reg32 R5(.clr(clr), .clk(clk), .Rin(R5in), .d(BusMuxOut), .q(BusMuxIn_R5));
				Reg32 R6(.clr(clr), .clk(clk), .Rin(R6in), .d(BusMuxOut), .q(BusMuxIn_R6));
				Reg32 R7(.clr(clr), .clk(clk), .Rin(R7in), .d(BusMuxOut), .q(BusMuxIn_R7));
				Reg32 R8(.clr(clr), .clk(clk), .Rin(R8in), .d(BusMuxOut), .q(BusMuxIn_R8));
				Reg32 R9(.clr(clr), .clk(clk), .Rin(R9in), .d(BusMuxOut), .q(BusMuxIn_R9));
				Reg32 R10(.clr(clr), .clk(clk), .Rin(R10in), .d(BusMuxOut), .q(BusMuxIn_R10));
				Reg32 R11(.clr(clr), .clk(clk), .Rin(R11in), .d(BusMuxOut), .q(BusMuxIn_R11));
				Reg32 R12(.clr(clr), .clk(clk), .Rin(R12in), .d(BusMuxOut), .q(BusMuxIn_R12));
				Reg32 R13(.clr(clr), .clk(clk), .Rin(R13in), .d(BusMuxOut), .q(BusMuxIn_R13));
				Reg32 R14(.clr(clr), .clk(clk), .Rin(R14in), .d(BusMuxOut), .q(BusMuxIn_R14));
				Reg32 R15(.clr(clr), .clk(clk), .Rin(R15in), .d(BusMuxOut), .q(BusMuxIn_R15));

                Reg32 PC(.clr(clr), .clk(clk), .Rin(PCin), .d(BusMuxOut), .q(BusMuxIn_PC));
                Reg32 Y(.clr(clr), .clk(clk), .Rin(Yin), .d(BusMuxOut), .q(BusMuxIn_Y));
                Reg32 Z_HI(.clr(clr), .clk(clk), .Rin(ZHIin), .d(C_data_out), .q(BusMuxIn_ZHI));
                Reg32 Z_LO(.clr(clr), .clk(clk), .Rin(Zin), .d(C_data_out), .q(BusMuxIn_ZLO));
                Reg32 HI(.clr(clr), .clk(clk), .Rin(HIin), .d(BusMuxOut), .q(BusMuxIn_HI));
                Reg32 LO(.clr(clr), .clk(clk), .Rin(LOin), .d(BusMuxOut), .q(BusMuxIn_LO));

                Reg32 IR(.clr(clr), .clk(clk), .Rin(IRin), .d(BusMuxOut), .q(BusMuxIn_IR));

                MDRreg MDR(.clr(clr), .clk(clk), .enable(MDRin), .Mdatain(MDatain), .BusMuxOut(BusMuxOut), .Read(Read), .MDRout(BusMuxIn_MDR));

                wire[4:0] encoderOut;

                //ThirtyTwoToFiveEncoder regEncoder(.Cin({{8{1'b0}},Cout,InPortout,MDRout,PCout,Zlowout,Zhighout,LOout,HIout,Rout}), .Cout(encoderOut));
                ThirtyTwoToFiveEncoder regEncoder(.Cin({{8{1'b0}},Cout,InPortout, MDRout, PCout,Zlowout,Zhighout,LOout,HIout,Rout}), .Cout(encoderOut));
					 
                ThirtyTwoToOneEncoder busMux(
                    .BusMuxIn_R0(BusMuxIn_R0),
                    .BusMuxIn_R1(BusMuxIn_R1), 
                    .BusMuxIn_R2(BusMuxIn_R2),
                    .BusMuxIn_R3(BusMuxIn_R3),
                    .BusMuxIn_R4(BusMuxIn_R4),
                    .BusMuxIn_R5(BusMuxIn_R5),
                    .BusMuxIn_R6(BusMuxIn_R6),
                    .BusMuxIn_R7(BusMuxIn_R7),
                    .BusMuxIn_R8(BusMuxIn_R8),
                    .BusMuxIn_R9(BusMuxIn_R9),
                    .BusMuxIn_R10(BusMuxIn_R10),
                    .BusMuxIn_R11(BusMuxIn_R11),
                    .BusMuxIn_R12(BusMuxIn_R12),
                    .BusMuxIn_R13(BusMuxIn_R13),
                    .BusMuxIn_R14(BusMuxIn_R14),
                    .BusMuxIn_R15(BusMuxIn_R15),
                    .BusMuxIn_HI(BusMuxIn_HI),
                    .BusMuxIn_LO(BusMuxIn_LO),
                    .BusMuxIn_Z_high(BusMuxIn_ZHI),
                    .BusMuxIn_Z_low(BusMuxIn_ZLO),
                    .BusMuxIn_PC(BusMuxIn_PC),
                    .BusMuxIn_MDR(BusMuxIn_MDR),	
                    .BusMuxIn_InPort(BusMuxIn_InPort),
                    .C_sign_extended(C_sign_extend),
                    .BusMuxOut(BusMuxOut),
                    .select(encoderOut)
                );

                alu alu_module(
                    .Rb(BusMuxOut),
                    .Ry(BusMuxIn_Y),
                    .AND(AND),
						  .OR(OR),
                    .NOT(NOT),
                    .NEG(NEG),
                    .resultLo(C_data_out)
                );


endmodule