module MDR_Reg(out, Mdatain, bus, wr, rd, clr, clk);
    output reg [31:0] out;
    input [31:0] Mdatain, bus;
    input rd, clr, clk, wr;
    wire [31:0] in;
    always @(posedge clk)
                if(clr)
                    out=0;
                else if(wr)
                    if(rd)
                        out = Mdatain;
                else
                        out = bus;
endmodule