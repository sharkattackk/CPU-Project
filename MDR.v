module MDRreg (clr, clk, enable, Mdatain, BusMuxOut, Read, MDRout);
    input clr, clk, enable, Read;
    input [31:0] Mdatain, BusMuxOut;
    output [31:0] MDRout;

    wire [31:0] MDRin;
    TwoToOneMux MDMux (Mdatain, BusMuxOut, Read, MDRin);
    Reg32 regMDR (.clr(clr), .clk(clk), .Rin(enable), .d(MDRin), .q(MDRout));

endmodule