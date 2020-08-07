/* This module contains different gates which
    are needed for our processor*/

module And32bits (inA, inB, out);
    input[31:0] inA, inB;
    output[31:0] out;

    assign out = inA & inB;

endmodule // And32bits


module Or32bit (inA, inB, out);
    input[31:0] inA, inB;
    output[31:0] out;

    assign out = inA | inB;

endmodule // Or32bits 