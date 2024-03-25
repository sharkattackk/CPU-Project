module inputOutputPort(input outputPortIn, clr, clk, inputPortOut,
                       input[31:0] bus,
                       output[31:0] busInPort);


wire[31:0] OutPort;
wire[31:0] IPdataIn;

Reg32 In(.q(busInPort), .d(IPdataIn), .Rin(inputPortOut), .clr(clr), .clk(clk))
Reg32 In(.q(OutPort), .d(bus), .Rin(outputPortIn), .clr(clr), .clk(clk))


