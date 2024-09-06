module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out
);

    assign out = in[sel*4 +: 4]; // Part-select를 사용하여 4비트 값을 선택

endmodule