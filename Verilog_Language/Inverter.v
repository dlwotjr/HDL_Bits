module top_module( input in, output out );
assign out = ~in;
endmodule

/*
비트 연산자 ~(Not)과 논리 연산자(Not -> !)
이것의 차이는 비트 연산자의 경우 비트 단위로 동작하며 여러 비트의 입력에 대해서도 각 비트 반전을 시킴
논리 연산자는 다중 비트 입력에 대해서는 전체값을 0 또는 1로 간주해 처리함
*/