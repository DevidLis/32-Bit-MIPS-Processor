/* Instruction Fetch / Instruction Decode module */

module IF_ID(out, instruction, progCounter, clk, en);
    input en, clk;
    input[31:0] instruction, progCounter;
    output[63:0] out;

    always @(posedge clk) begin
        if (en)
            out <= {instruction, progCounter};
        else
            out <= 64'b0; 
    end
endmodule // IF_IF