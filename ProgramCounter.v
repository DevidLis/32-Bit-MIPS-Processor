`include "DFF.v"

module ProgramCounter(out, in, clk, resetb);
    input clk, resetb;
    input[31:0] in;
    output[31:0] out;
    genvar j;

    generate for (j=0; j<32; j=j+1) begin: counterLoop
        dff idff(out[j], in[j], clk, resetb);
    end 
    endgenerate
endmodule //ProgramCounter