/* Test bench for gates module */

`timescale 1us/1ns
`include "Gates.v"

module Gates_tb();
    reg[31:0] inA; reg[31:0] inB;
    wire[31:0] outAnd; wire[31:0] outOr;
    // Create 1 AND gate and 1 OR gate
    And32bits iAnd32bits(inA, inB, outAnd);
    Or32bit iOr32bit(inA, inB, outOr);
    // Test different inputs for the gates
    initial begin
        $monitor("A = %h, B = %h: AND = %h, OR = %h", 
                inA, inB, outAnd, outOr);
        $dumpfile("Gates.vcd");
        $dumpvars(0, Gates_tb);
        inA <= 32'h0000_0000;
        inB <= 32'h0000_0000;
        #1;
        inA <= 32'hffff_ffff;
        inB <= 32'h0000_0000;
        #1;
        inA <= 32'h0000_0000;
        inB <= 32'hffff_ffff;
        #1;
        inA <= 32'h5555_5555;
        inB <= 32'haaaa_aaaa;
        #1;
        inA <= 32'hffff_ffff;
        inB <= 32'hffff_ffff;
        #1;
    end
endmodule // Gates_tb