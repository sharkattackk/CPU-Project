`timescale 1ns/10ps
module select_encode(
    input [31:0] IR, 
    input Gra, Grb, Grc, Rin, Rout, BAout, 
    output [15:0] SERin, SERout, 
    output [31:0] C_sign_extended
    );

    // Correct IR Address spcae for Ra, Rb, Rc AND with 4 bits of Gra, Grb, Grc signal
    wire [3:0] Ra = IR[26:23] & {4{Gra}};
    wire [3:0] Rb = IR[22:19] & {4{Grb}};
    wire [3:0] Rc = IR[18:15] & {4{Grc}};

    // OR outputs of Ra Rb Rc
    wire [3:0] orABC = Ra | Rb | Rc;

    // Temp Reg for decoder output
    wire [15:0] decoderOut ;
    decoder_4_to_16 decoder_orABC(.in(orABC), .out(decoderOut));

    // OR Rout and BAout as seen in logic
    wire RBAout = Rout | BAout;

    // assign SERin with 16 bit Rin input and output from 4 to 16 decoder
    assign SERin = {16{Rin}} & decoderOut;

    // assign SERout using RBAout's OR ouput then AND that with 4 to 16 decoder output
    assign SERout = {16{RBAout}} & decoderOut;

    // C covers from IR[18:0] (19 bits total) and you want to sign extend the 19th bit aka [18] from 31 to 19
    // there are 13 bits between 31:19 so u want to exted 13 bits with the same signature as [18]
    assign C_sign_extended = {{13{IR[18]}}, IR[18:0]};

endmodule

