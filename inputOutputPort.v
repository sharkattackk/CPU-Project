module inputOutputPort(input outputPortIn, clr, clk, inputPortOut,
                       input[31:0] bus,
                       output[31:0] busInPort);


wire[31:0] OutPort;
wire[31:0] IPdataIn;

Reg32 In(.q(busInPort), .d(IPdataIn), .en(inputPortOut), .clr(clr), .clk(clk));
Reg32 Out(.q(OutPort), .d(bus), .en(outputPortIn), .clr(clr), .clk(clk));

endmodule
