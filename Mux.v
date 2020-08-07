/* Module for mux units*/

module Mux2to1(inA, inB, sel, out);
    input inA, inB, sel;
    output out;
    wire sel_b, and1out, and2out;

    not (sel_b, sel);
    and (and1out, sel_b, inA);
    and (and2out, sel, inB);
    or (out, and1out, and2out);
endmodule // Mux2to1

module Mux3to1(inA, inB, inC, sel, out);
    input inA, inB, inC;
    input[1:0] sel;
    output out;
    wire muxConnector;

    Mux2to1 iMux2to1_1(inA, inB, sel[0], muxConnector);
    Mux2to1 iMux2to1_2(muxConnector, inC, sel[1], out);
endmodule // Mux3to1

module Mux3to1_32bit (inA, inB, inC, sel, out);
    input[31:0] inA, inB, inC;
    input[1:0] sel;
    output[31:0] out;
    genvar j;

    generate
        for(j=0; j<32; j=j+1) begin: muxLoop
            Mux3to1 iMux3to1(inA[j], inB[j], inC[j], sel, out[j]);
        end
    endgenerate
endmodule // Mux3to1_32bit
