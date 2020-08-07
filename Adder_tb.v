/* This is the test bench for the thirty two bit adder.
    Since the thirty two bit adder is made from 2 sixteen 
    bit adders (and so on...) it is enough to test the thirty
    two bit adder.
    However, the rest of the test are written here and commented out. */ 
`timescale 1us/1ns
`include "Adder.v"

/*module halfAdder_tb();

    reg inA; reg inB;
    wire carryOut; wire sum;

    halfAdder ihalfAdder(inA, inB, sum, carryOut);
    initial begin
        $monitor("%b + %b = %b; carry = %b", inA, inB, sum, carryOut);
        inA = 1'b0; inB = 1'b0; #1; 
        inA = 1'b1; inB = 1'b0; #1; 
        inA = 1'b0; inB = 1'b1; #1; 
        inA = 1'b1; inB = 1'b1; #1; 
    end

endmodule*/


/*module oneBitFullAdder_tb();

    reg inA; reg inB; reg carryIn;
    wire carryOut; wire sum;

    oneBitFullAdder ioneBitFullAdder(inA, inB, carryIn, sum, carryOut);
    initial begin
        $monitor("carry in = %b, %b + %b = %b; carry out = %b", carryIn, inA, inB, sum, carryOut);
        carryIn = 1'b0;
        inA = 1'b0; inB = 1'b0; #1; 
        inA = 1'b1; inB = 1'b0; #1; 
        inA = 1'b0; inB = 1'b1; #1; 
        inA = 1'b1; inB = 1'b1; #1;
        carryIn = 1'b1;
        inA = 1'b0; inB = 1'b0; #1; 
        inA = 1'b1; inB = 1'b0; #1; 
        inA = 1'b0; inB = 1'b1; #1; 
        inA = 1'b1; inB = 1'b1; #1;        
    end
endmodule*/


/*module twoBitFullAdder_tb();

    reg[1:0] inA; reg[1:0] inB; reg carryIn;
    wire carryOut; wire[1:0] sum;

    twoBitFullAdder itwoBitFullAdder(inA, inB, carryIn, sum, carryOut);
    initial begin
        $monitor("carry in = %b, %b + %b = %b; carry out = %b", carryIn, inA, inB, sum, carryOut);
        carryIn = 1'b0;
        inA = 2'b00;
        inB = 2'b00; #1; inB = 2'b01; #1; inB = 2'b10; #1; inB = 2'b11; #1;
        inA = 2'b01;
        inB = 2'b00; #1; inB = 2'b01; #1; inB = 2'b10; #1; inB = 2'b11; #1;
        inA = 2'b10;
        inB = 2'b00; #1; inB = 2'b01; #1; inB = 2'b10; #1; inB = 2'b11; #1;
        inA = 2'b11;
        inB = 2'b00; #1; inB = 2'b01; #1; inB = 2'b10; #1; inB = 2'b11; #1;
        carryIn = 1'b1;
        inA = 2'b00;
        inB = 2'b00; #1; inB = 2'b01; #1; inB = 2'b10; #1; inB = 2'b11; #1;
        inA = 2'b01;
        inB = 2'b00; #1; inB = 2'b01; #1; inB = 2'b10; #1; inB = 2'b11; #1;
        inA = 2'b10;
        inB = 2'b00; #1; inB = 2'b01; #1; inB = 2'b10; #1; inB = 2'b11; #1;
        inA = 2'b11;
        inB = 2'b00; #1; inB = 2'b01; #1; inB = 2'b10; #1; inB = 2'b11; #1;
    end
endmodule*/

/*module fourBitFullAdder_tb();

    reg[3:0] inA; reg[3:0] inB; reg carryIn;
    wire carryOut; wire[3:0] sum;

    fourBitFullAdder ifourBitFullAdder(inA, inB, carryIn, sum, carryOut);
    initial begin
        $monitor("carry in = %b, %b + %b = %b; carry out = %b", carryIn, inA, inB, sum, carryOut);
        carryIn = 1'b0;
        inA = 4'b0000; inB = 4'b0000; #1;
        inA = 4'b0101; inB = 4'b1010; #1;
        inA = 4'b1111; inB = 4'b0000; #1;
        inA = 4'b1111; inB = 4'b1111; #1;
        carryIn = 1'b1;
        inA = 8'b0000; inB = 8'b0000; #1;
        inA = 8'b0101; inB = 8'b1010; #1;
        inA = 8'b1111; inB = 8'b0000; #1;
        inA = 8'b1111; inB = 8'b1111; #1;
    end
endmodule*/


module thritytwoBitFullAdder_tb();
    // Input registers and output wires
    reg[31:0] inA; reg[31:0] inB; reg carryIn;
    wire carryOut; wire[31:0] sum;
    // Create 1 thirty two bit full adder instance
    thirtytwoBitFullAdder ithirtytwoBitFullAdder(inA, inB, carryIn, sum, carryOut);
    initial begin
        // Print to the monitor
        $monitor("carry in = %h, %h + %h = %h; carry out = %h", carryIn, inA, inB, sum, carryOut);
        //Create dump file and set dump variables
        $dumpfile("Adder.vcd");
        $dumpvars(0, thritytwoBitFullAdder_tb);
        // Set carry in to 0 and check a few inputs
        carryIn <= 32'h0;
        inA <= 32'h0000_0000; inB <= 32'h0000_0000; #1;
        inA <= 32'h5555_5555; inB <= 32'haaaa_aaaa; #1;
        inA <= 32'hffff_ffff; inB <= 32'h0000_0000; #1;
        inA <= 32'hffff_ffff; inB <= 32'hffff_ffff; #1;
        // Set carry in to 1 and check a few inputs
        carryIn <= 32'h1;
        inA <= 32'h0000_0000; inB <= 32'h0000_0000; #1;
        inA <= 32'h5555_5555; inB <= 32'haaaa_aaaa; #1;
        inA <= 32'hffff_ffff; inB <= 32'h0000_0000; #1;
        inA <= 32'hffff_ffff; inB <= 32'hffff_ffff; #1;
    end
endmodule // thritytwoBitFullAdder_tb