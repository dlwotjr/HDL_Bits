//positional instantation solution
//이건 내부 모듈의 인자값을 몰라도 사용이 가능함

module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a ins1(out1,out2,a,b,c,d);
endmodule