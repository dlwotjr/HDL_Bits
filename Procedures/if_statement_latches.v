/*
- "출력을 변경하지 않고 유지"라는 동작은 상태 기억이 필요 -> latch 생성
- else 항상 쓸 것 of default값
*/
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
           shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else 
           keep_driving = ~arrived;
    end

endmodule