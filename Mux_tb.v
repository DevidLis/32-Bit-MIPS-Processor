/* Test bench for mux module */

`timescale 1us/1ns
`include "Mux.v"

module Mux_tb();
    reg[31:0] inA; reg[31:0] inB; reg[31:0] inC;
    reg[1:0] sel;
    wire[31:0] out;

    Mux3to1_32bit iMux3to1_32bit(inA, inB, inC, sel, out);

    initial begin
        $monitor("A = %h, B = %h, C = %h, select = %b: out = %h",
                    inA, inB, inC, sel, out);
        $dumpfile("Mux.vcd");
        $dumpvars(0, Mux_tb);
        inA = 32'h5555_5555; inB = 32'haaaa_aaaa; inC = 32'hffff_ffff;
        sel = 2'b00; #1;
        sel = 2'b01; #1;
        sel = 2'b10; #1;
        sel = 2'b11; #1;
    end
endmodule //Mux_tb