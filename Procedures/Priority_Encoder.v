//3가지 풀이

module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always@(*)begin
        casez(in)
            4'b???1 : pos = 2'd0;
            4'b??10 : pos = 2'd1;
            4'b?100 : pos = 2'd2;
            4'b1000 : pos = 2'd3;
            default pos = 2'd0;
        endcase
    end
endmodule

module top_module (
	input [3:0] in,
	output reg [1:0] pos
);

	always @(*) begin			// Combinational always block
		case (in)
			4'h0: pos = 2'h0;	// I like hexadecimal because it saves typing.
			4'h1: pos = 2'h0;
			4'h2: pos = 2'h1;
			4'h3: pos = 2'h0;
			4'h4: pos = 2'h2;
			4'h5: pos = 2'h0;
			4'h6: pos = 2'h1;
			4'h7: pos = 2'h0;
			4'h8: pos = 2'h3;
			4'h9: pos = 2'h0;
			4'ha: pos = 2'h1;
			4'hb: pos = 2'h0;
			4'hc: pos = 2'h2;
			4'hd: pos = 2'h0;
			4'he: pos = 2'h1;
			4'hf: pos = 2'h0;
			default: pos = 2'b0;	// Default case is not strictly necessary because all 16 combinations are covered.
		endcase
	end
	
	// There is an easier way to code this. See the next problem (always_casez).
	
endmodule

module priority_encoder_4bit (
    input [3:0] in,  // 4-bit input
    output reg [1:0] out  // 2-bit output
);

always @(*) begin
    if (in[3])
        out = 2'b11;  // If bit 3 is 1, output is 3
    else if (in[2])
        out = 2'b10;  // If bit 2 is 1, output is 2
    else if (in[1])
        out = 2'b01;  // If bit 1 is 1, output is 1
    else if (in[0])
        out = 2'b00;  // If bit 0 is 1, output is 0
    else
        out = 2'b00;  // If none of the bits are 1, output is 0
end

endmodule