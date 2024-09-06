//다중 비트 결과 할당
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
    assign outv = vec[2:0]; // 이런 식으로 다중 비트 결과 할당 한다
    assign o0 = vec[0];
    assign o1 = vec[1];
    assign o2 = vec[2];
endmodule