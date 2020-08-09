/* D-flip-flop module */

module dff(Q, D, clk, resetb);
    input D, resetb, clk;
    output reg Q;

    always @(posedge clk or negedge resetb) 
    begin
        if (~resetb) Q <= 1'b0;
        else Q <= D;
    end
endmodule // dff


module thirtyTwoBitDFF(Q, D, clk, resetb);
    input [31:0] D;
    input resetb, clk;
    output [31:0] Q;

    genvar j;

    generate for (j = 0; j < 32; j = j+1) begin: regLoop
        dff idff(Q[j], D[j], clk, resetb);
        end
    endgenerate
endmodule // thirtyTwoBitDFF

