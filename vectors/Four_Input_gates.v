module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = in[0] & in[1] & in[2] & in[3];
    assign out_or = in[0] | in[1] | in[2] | in[3];
    assign out_xor = in[0] ^ in[1] ^ in[2] ^ in[3];
endmodule

/*
더 간단하게 나타내는 법
    assign out_and = &in;   // in 배열의 모든 비트를 AND 연산
    assign out_or = |in;    // in 배열의 모든 비트를 OR 연산    
    assign out_xor = ^in;   // in 배열의 모든 비트를 XOR 연산
*/