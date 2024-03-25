module R0reg(
    input [31:0] inD,
    input clear, clock, enble, BAout,
    output [31:0] out
    );
    wire [31:0] Q;

    Reg32 R0(.clr(clear), .clk(clock), .en(enble), .d(inD), .q(Q));

    wire BAoutNot = !BAout;

    assign out = BAoutNot & Q;

endmodule 