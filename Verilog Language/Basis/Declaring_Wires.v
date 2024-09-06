`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

wire net_ab;  // wire 변수 선언
wire net_cd;  // wire 변수 선언

assign net_ab = a & b;  // wire 변수에 값 할당   wire net_ab = a & b;이렇게 하면 할당과 선언 동시에 가능
assign net_cd = c & d;  // wire 변수에 값 할당
assign out = net_ab | net_cd;
assign out_n = ~out;


endmodule