//나의 답안
module top_module (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output reg [3:0] mux_in
); 
    always @(*) begin
        if (c== 0 && d == 0) 
            mux_in = 4'b0100;
        else if (c == 0 && d == 1) 
            mux_in = 4'b0001;
        else if (c == 1 && d == 0) 
            mux_in = 4'b0101;
        else 
            mux_in = 4'b1001;
    end
endmodule

//solution
module top_module (
	input c,
	input d,
	output [3:0] mux_in
);
	
	// After splitting the truth table into four columns,
	// the rest of this question involves implementing logic functions
	// using only multiplexers (no other gates).
	// I will use the conditional operator for each 2-to-1 mux: (s ? a : b)
	assign mux_in[0] = c ? 1 : d;          // 1 mux:   c|d
	assign mux_in[1] = 0;                  // No muxes:  0
	assign mux_in[2] = d ? 0 : 1;          // 1 mux:    ~d
	assign mux_in[3] = c ? d : 0;          // 1 mux:   c&d
	
endmodule