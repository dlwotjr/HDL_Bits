module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

wire net_p2ab = p2a & p2b;
    wire net_p2cd = p2c & p2d;
    assign p2y = net_p2ab | net_p2cd;
    wire net_p1abc = p1a & p1b & p1c;
    wire net_p1def = p1d & p1e & p1f;
    assign p1y = net_p1abc | net_p1def;//할당시 assign 빼먹으면 안대
endmodule