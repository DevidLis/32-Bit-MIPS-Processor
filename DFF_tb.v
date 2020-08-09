/* Test bench for DFF */

`timescale 1us/1ns
`include "DFF.v"

/* module dff_tb();
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
endmodule //dff_tb */

module thirtyTwoBitDFF_tb();
    reg[31:0] D; reg resetb; reg clk;
    wire[31:0] Q;

    thirtyTwoBitDFF ithirtyTwoBitDFF(Q, D, clk, resetb);

    initial begin 
        clk <= 1'b0;
        resetb <= 1'b1;
        D <= 32'b0;
    end

    always begin 
        forever #1 clk = ~clk;
    end

    initial begin
        $monitor($time, " Clock: %b, D: %h, resetb: %b, Q: %h", 
                        clk, D, resetb, Q);
        $dumpfile("thirtyTwoBitDFF.vcd");
        $dumpvars(0, thirtyTwoBitDFF_tb);
        #5;
        D <= 32'haaaa_aaaa;
        #5;
        D <= 32'b0;
        #5;
        resetb <= 1'b0;
        #5;
        D <= 32'hffff_ffff;
        #5;
        $stop;

    end
endmodule // thirtyTwoBitDFF_tb