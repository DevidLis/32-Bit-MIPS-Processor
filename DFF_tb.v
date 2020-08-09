/* Test bench for DFF */

`timescale 1us/1ns
`include "DFF.v"

module dff_tb();
    reg D; reg resetb; reg clk;
    wire Q;

    dff idff(Q, D, clk, resetb);

    initial begin 
        clk <= 1'b0;
        resetb <= 1'b1;
        D <= 1'b0;
    end

    always begin 
        forever #1 clk = ~clk;
    end

    initial begin
        $monitor($time, " Clock: %b, D: %b, resetb: %b, Q: %b", 
                        clk, D, resetb, Q);
        $dumpfile("DFF.vcd");
        $dumpvars(0, dff_tb);
        #5;
        D <= 1'b1;
        #5;
        D <= 1'b0;
        #5;
        resetb <= 1'b0;
        #5;
        D <= 1'b1;
        #5;
        $stop;

    end
endmodule