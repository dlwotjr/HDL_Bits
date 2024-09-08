module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @ (posedge clk) begin
        if (resetn==0)       
            q[7:0] <= 0;
        else if(byteena[0] == 1)
            q[7:0] <= d[7:0];
    end
    
    always @ (posedge clk) begin
        if (resetn==0)       
            q[15:8] <= 0;
        else if(byteena[1] == 1)
            q[15:8] <= d[15:8];
    end
endmodule