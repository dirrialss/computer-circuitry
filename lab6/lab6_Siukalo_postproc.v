// Post-processor for 8-bit adder analysis without parity
module postprocessor (
    input [7:0] Ain, Bin,    // Input operands
    input Ci,                // Carry-in
    input [7:0] Result,      // Adder output
    input Co,                // Carry-out
    output overflow,         // Overflow flag
    output zero,             // Zero flag
    output negative          // Negative flag
);
    // Overflow detection (for signed numbers)
    assign overflow = (~Ain[7] & ~Bin[7] & Result[7]) | 
                    (Ain[7] & Bin[7] & ~Result[7]);
    
    // Status flags
    assign zero = (Result == 8'b00000000);
    assign negative = Result[7];
    
    // Display analysis results (console output)
    always @(*) begin
        $display("[POST-PROC] A=%8b, B=%8b, Cin=%b ? Result=%8b", Ain, Bin, Ci, Result);
        $display("            Flags: OV=%b, Z=%b, N=%b", 
                overflow, zero, negative);
    end
endmodule