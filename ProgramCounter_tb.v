`timescale 1us/1ns
`include "ProgramCounter.v"

module ProgramCounter_tv();
    reg[31:0] in;
    reg clk, resetb;
    wire[31:0] out;

    ProgramCounter iProgramCounter(out, in, clk, resetb);
    initial begin
        clk <= 1'b0;
        resetb <= 1'b1;
        in <=  32'b0;
    end

    always begin
        forever #1 clk = ~clk;
    end

    initial begin
        $monitor("clk = %b, resetb = %b, in = %h : out = %h", 
                    clk, resetb, in, out);
        $dumpfile("ProgramCounter.vcd");
        $dumpvars();
        #5;
        in <= 32'haaaa_aaaa;
        #5;
        in <= 32'hffff_ffff;
        #5;
        resetb <= 1'b0;
        #5;
        in <= 32'h5555_5555;
        #5;
        $stop;
    end

endmodule // ProgramCounter_tb