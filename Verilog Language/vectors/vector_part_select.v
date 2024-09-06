module top_module( 
    input [31:0] in,
    output [31:0] out );//

    assign out[31:24] = in[7:0];
    assign out[23:16] = in[15:8];
    assign out[15:8] = in[23:16];
    assign out[7:0] = in[31:24];
	//assign out = {in[7:0], in[15:8], in[23:16], in[31:24]};
	//이렇게도 할수 있다 생각하자
endmodule