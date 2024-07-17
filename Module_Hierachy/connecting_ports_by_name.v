/*
문제 : Connecting Ports by name
- 이 문제는 named Association문제임
- 들어가는 인자는 ==.mod_a인자(top_module인자)== 형식임
*/
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a inst(.in1(a),.in2(b),.in3(c),.in4(d),.out1(out1),.out2(out2));
endmodule