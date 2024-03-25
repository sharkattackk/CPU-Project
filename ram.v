module ram(
    input [7:0] address,
    input [31:0] data_in,
    input we, // Write Enable
    input re, //Read Enable
    output reg [31:0] data_out
);
    reg [31:0] RAM[511:0];

    initial begin: initialize
        $readmemh("/Initialize.hex",, RAM);
    end

    always @(*) begin
        if (we) begin
            RAM[address] <= data_in;
        end else if (re) begin
            data_out <= RAM[address];
        end
    end
endmodule