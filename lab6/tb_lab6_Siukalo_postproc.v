`timescale 1ns/1ps
`include "lab6_Siukalo_sum.v"
`include "lab6_Siukalo_postproc.v"

module postproc_testbench;
    // Test signals
    reg [7:0] Ain, Bin;
    reg Ci;
    wire [7:0] Result;
    wire Co;
    
    // Post-processor connections
    wire ov, z, n;
    
    // Instantiate modules
    my_sum adder (.Ain(Ain), .Bin(Bin), .Ci(Ci), .Sout(Result), .Co(Co));
    postprocessor pp (.Ain(Ain), .Bin(Bin), .Ci(Ci), .Result(Result), .Co(Co),
                     .overflow(ov), .zero(z), .negative(n));

    // Test cases
    initial begin
        $display("\n=== 8-bit Adder Post-Processor Analysis ===");
        
        // 1. Positive + Positive (no overflow)
        Ain = 8'b01000001; // 65
        Bin = 8'b00101010; // 42
        Ci = 0;
        #10;
        
        // 2. Large positive + Small negative (no overflow)
        Ain = 8'b01010101; // 85
        Bin = 8'b11010110; // -42
        Ci = 0;
        #10;
        
        // 3. Small positive + Large negative (no overflow)
        Ain = 8'b00101010; // 42
        Bin = 8'b10101011; // -85
        Ci = 0;
        #10;
        
        // 4. Negative + Negative (with overflow)
        Ain = 8'b10111111; // -65
        Bin = 8'b11010110; // -42
        Ci = 0;
        #10;
        
       
        
        $display("\n=== Simulation Complete ===");
        $finish;
    end
endmodule