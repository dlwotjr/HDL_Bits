module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    assign {w,x,y,z}={a,b,c,d,e,f,2'b11};
endmodule

/*
- {}연산자는 '연결 연산자'
	- 신호들을 순서대로 연결하여 하나의 벡터로 만듬
*/