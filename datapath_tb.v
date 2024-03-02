// and datapath_tb.v file: <This is the filename>
`timescale 1ns/10ps
module datapath_tb;
    reg clk;
    reg clr;
    reg R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
    reg MDRin, MARin;
    reg Read;
    reg HIin, LOin, InPortout, Cout;
    reg Zin, PCin, IRin, Yin;
	reg PCout, Zlowout, Zhighout, MDRout, R2out, R3out, LOout, HIout; // add any other signals to see in your simulation
	reg IncPC, AND;
	reg [31:0] Mdatain;
	
parameter Default = 4'b0000, 
			 Reg_load1a = 4'b0001, 
			 Reg_load1b = 4'b0010, 
			 Reg_load2a = 4'b0011,
			 Reg_load2b = 4'b0100, 
			 Reg_load3a = 4'b0101, 
			 Reg_load3b = 4'b0110, 
			 T0 = 4'b0111,
			 T1 = 4'b1000, 
			 T2 = 4'b1001, 
			 T3 = 4'b1010, 
			 T4 = 4'b1011, 
			 T5 = 4'b1100;

reg [3:0] Present_state = Default;


datapath DUT(.PCout(PCout), .Zlowout(Zlowout), .Zhighout(Zhighout), .MDRout(MDRout), .R2out(R2out), .R3out(R3out), .MARin(MARin), .Zin(Zin), .PCin(PCin), .Cout(Cout), .InPortout(InPortout),
              .MDRin(MDRin), .IRin(IRin), .Yin(Yin), .IncPC(IncPC), .LOout(LOout), .HIout(HIout), .Read(Read), .AND(AND), .R1in(R1in), .R2in(R2in), .R3in(R3in), .clk(clk), .MDatain(Mdatain));


// add test logic here
initial
	begin
		clk = 0;
	forever #10 clk = ~ clk;
end
always @(posedge clk) // finite state machine; if clk rising-edge
	begin
		case (Present_state)
			Default: 
				Present_state = Reg_load1a;
			Reg_load1a: 
				Present_state = Reg_load1b;
			Reg_load1b: 
				Present_state = Reg_load2a;
			Reg_load2a: 
				Present_state = Reg_load2b;
			Reg_load2b: 
				Present_state = Reg_load3a;
			Reg_load3a: 
				Present_state = Reg_load3b;
			Reg_load3b:
				Present_state = T0;
			T0: 
				Present_state = T1;
			T1: 
				Present_state = T2;
			T2: 
				Present_state = T3;
			T3:
				Present_state = T4;
			T4:
				Present_state = T5;
		endcase
	end

always @(Present_state) // do the required job in each state
	begin
		case (Present_state) // assert the required signals in each clk cycle
			Default: 
				begin
					PCout <= 0; Zlowout <= 0; Zhighout <= 0; MDRout <= 0; // initialize the signals
					R2out <= 0; R3out <= 0; MARin <= 0; Zin <= 0;
					PCin <=0; MDRin <= 0; IRin <= 0; Yin <= 0;
					IncPC <= 0; Read <= 0; AND <= 0;
					HIout <= 0; LOout <= 0;
					Cout <= 0; InPortout <=0; 
					R1in <= 0; R2in <= 0; R3in <= 0; Mdatain <= 32'h00000000;
				end
			Reg_load1a: 
				begin
					Mdatain <= 32'h00000012;
					Read = 0; MDRin = 0; // the first zero is there for completeness
					#10 Read <= 1; MDRin <= 1; // and the first 10ns might not be needed depending on your
					#15 Read <= 0; MDRin <= 0; // implementation; same goes for the other states
				end
			Reg_load1b: 
				begin
					#10 MDRout <= 1; R2in <= 1;
					#15 MDRout <= 0; R2in <= 0; // initialize R2 with the value $12
				end
			Reg_load2a: 
				begin
					Mdatain <= 32'h00000014;
					#10 Read <= 1; MDRin <= 1;
					#15 Read <= 0; MDRin <= 0;
				end
			Reg_load2b:
				begin
					#10 MDRout <= 1; R3in <= 1;
					#15 MDRout <= 0; R3in <= 0; // initialize R3 with the value $14
				end
			Reg_load3a: 
				begin
					Mdatain <= 32'h00000018;
					#10 Read <= 1; MDRin <= 1;
					#15 Read <= 0; MDRin <= 0;
				end
			Reg_load3b: 
				begin
					#10 MDRout <= 1; R1in <= 1;
					#15 MDRout <= 0; R1in <= 0; // initialize R1 with the value $18
				end
			T0: 
				begin // see if you need to de-assert these signals
					PCout <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;
				end
			T1: 
				begin
					Zlowout <= 1; PCin <= 1; Read <= 1; MDRin <= 1;
					Mdatain <= 32'h28918000; // opcode for “and R1, R2, R3”
				end
			T2: 
				begin
					MDRout <= 1; IRin <= 1;
				end
			T3: 
				begin
					R2out <= 1; Yin <= 1;
				end
			T4: 
				begin
					R3out <= 1; AND <= 1; Zin <= 1;
				end
			T5: 
				begin
					Zlowout <= 1; R1in <= 1;
				end
		endcase
	end
endmodule