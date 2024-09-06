module top_module(
    input [99:0] in,
    output [99:0] out
);

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : bit_reverse
            assign out[99-i] = in[i];
        end
    endgenerate

endmodule


module top_module(
    input [99:0] in,
    output reg [99:0] out
);
    always @(*) begin
        integer i;
        for (i = 0; i < 100; i = i + 1) begin
            out[99 - i] = in[i];
        end
    end
endmodule