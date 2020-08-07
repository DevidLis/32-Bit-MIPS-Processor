/* This module contains a thirty two bit adder,
    which is made from 2 sixteen bit adders, which are in turn
    made from 2 eight bit adders, and so on.
    The most basic unit is the half adder.*/

module halfAdder(inA, inB, sum, carryOut);
    input inA, inB;
    output sum, carryOut;

    xor ixor(sum, inA, inB);
    and iand(carryOut, inA, inB);

endmodule


module oneBitFullAdder(inA, inB, carryIn, sum, carryOut);
    input inA, inB, carryIn;
    output sum, carryOut;
    wire sum1, carryOut1, carryOut2;

    halfAdder ihalfAdder1(inA, inB, sum1, carryOut1);
    halfAdder ihalfAdder2(sum1, carryIn, sum, carryOut2);
    or ior(carryOut, carryOut1, carryOut2);

endmodule


module twoBitFullAdder(inA, inB, carryIn, sum, carryOut);
    input[1:0] inA, inB;
    input carryIn;
    output[1:0] sum;
    output carryOut;
    wire carryOut1;

    oneBitFullAdder ioneBitFullAdder1(inA[0], inB[0], carryIn, sum[0], carryOut1);
    oneBitFullAdder ioneBitFullAdder2(inA[1], inB[1], carryOut1, sum[1], carryOut);

endmodule


module fourBitFullAdder(inA, inB, carryIn, sum, carryOut);
    input[3:0] inA, inB;
    input carryIn;
    output[3:0] sum;
    output carryOut;
    wire carryOut1;

    twoBitFullAdder itwoBitFullAdder1(inA[1:0], inB[1:0], carryIn, sum[1:0], carryOut1);
    twoBitFullAdder itwoBitFullAdder2(inA[3:2], inB[3:2], carryOut1, sum[3:2], carryOut);

endmodule


module eightBitFullAdder(inA, inB, carryIn, sum, carryOut);
    input[7:0] inA, inB;
    input carryIn;
    output[7:0] sum;
    output carryOut;
    wire carryOut1;

    fourBitFullAdder ifourBitFullAdder1(inA[3:0], inB[3:0], carryIn, sum[3:0], carryOut1);
    fourBitFullAdder ifourBitFullAdder2(inA[7:4], inB[7:4], carryOut1, sum[7:4], carryOut);

endmodule


module sixteenBitFullAdder(inA, inB, carryIn, sum, carryOut);
    input[15:0] inA, inB;
    input carryIn;
    output[15:0] sum;
    output carryOut;
    wire carryOut1;

    eightBitFullAdder ieightBitFullAdder1(inA[7:0], inB[7:0], carryIn, sum[7:0], carryOut1);
    eightBitFullAdder ieightBitFullAdder2(inA[15:8], inB[15:8], carryOut1, sum[15:8], carryOut);

endmodule


module thirtytwoBitFullAdder(inA, inB, carryIn, sum, carryOut);
    input[31:0] inA, inB;
    input carryIn;
    output[31:0] sum;
    output carryOut;
    wire carryOut1;

    sixteenBitFullAdder isixteenBitFullAdder1(inA[15:0], inB[15:0], carryIn, sum[15:0], carryOut1);
    sixteenBitFullAdder isixteenBitFullAdder2(inA[31:16], inB[31:16], carryOut1, sum[31:16], carryOut);

endmodule

