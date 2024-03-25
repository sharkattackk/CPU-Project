`timescale 1ns/10ps

module con_ff(input [1:0] IR_bit, input [31:0] bus, input Con_in, output Con_out);
        wire [3:0] decoderOut;
        wire eq, notEq, pos, neg, eval;

        assign Con_out = 0;

        assign eq       = (bus == 32'd0) ? 1'b1 : 1'b0;
        assign notEq    = (bus != 32'd0) ? 1'b1 : 1'b0;
        assign pos      = (bus[31] == 0) ? 1'b1 : 1'b0;
        assign neg      = (bus[31] == 1) ? 1'b1 : 1'b0;

        decoder_2_to_4 decoder(IR_bit, decoderOut);

        assign eval = (decoderOut[0]&eq|decoderOut[1]&notEq|decoderOut[2]&pos|decoderOut[3]&neg);
        ff_logic conff(.clk(Con_in), .D(eval), .Q(Con_out));

endmodule
