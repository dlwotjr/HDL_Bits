module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise = a | b;
    assign out_or_logical = a||b;
    assign out_not = {~b[2:0],~a[2:0] };
endmodule

/*
- Bitwise Operator / Logical Opertor
	- Bitwise Or의 경우 '값'으로 나오나 Logical Operator의 경우 0아니면 1이다.
	- Logical Operator의 내부 연산은 각 자리수가 0이 아닌지 확인 하는 것
	- 또한 a, b가 output의 범위를 벗어나는 경우 


    assign out_or_bitwise = {3'b0, a} | {3'b0, b};
*/

