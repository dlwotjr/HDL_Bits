module top_module (
    input clk,
    input x,
    output reg z
); 
    reg q1, q2, q3; 
    
    always @ (posedge clk) begin
        q1 <= q1 ^ x;       
        q2 <= ~q2 & x;       
        q3 <= ~q3 | x; 
        //기존 틀린 풀이는 
        //z <=  ~(q1 | q2 | q3); z는 conbinational logic임
        //따라서 외부 할당 해야함     
    end

    assign z = ~(q1 | q2 | q3);
     
endmodule