/*D-flipflop module*/

module dff(Q, D, clk, resetb);
    input D, resetb, clk;
    output reg Q;

    always @(posedge clk or negedge resetb) 
    begin
        if (~resetb) Q <= 1'b0;
        else Q <= D;
    end
endmodule

