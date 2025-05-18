module test_sum;
    // Test registers and wires
    reg [7:0] Ain_r, Bin_r;    // 8-bit input registers
    reg Ci_r;                  // Carry input register
    wire [7:0] Ain, Bin;       // 8-bit input wires
    wire Ci;                   // Carry input wire
    wire [7:0] res_my, res_ref; // 8-bit output wires
    wire cm, cr;               // Carry output wires
    
    // Connect registers to wires
    assign Ain = Ain_r;
    assign Bin = Bin_r;
    assign Ci = Ci_r;
    
    // Instantiate the modules to be tested
    my_sum my_block (Ain, Bin, Ci, res_my, cm);   // Structural adder
    ref_sum ref_block (Ain, Bin, Ci, res_ref, cr); // Behavioral reference model
    
        initial begin
        $display("Time\tAin     \tBin     \tCi\tres_my  \tcm\tres_ref \tcr");
        $monitor("%4d\t%08b\t%08b\t%b\t%08b\t%b\t%08b\t%b", 
                 $time, Ain, Bin, Ci, res_my, cm, res_ref, cr);
        #500 $finish;
    end
    
    
    // Initial block for Ain stimulus
    initial begin
        // Test various values for Ain
        Ain_r = 8'b00000001;    // 1
        #50 Ain_r = 8'b00001010; // 10
        #50 Ain_r = 8'b00101010; // 42
        #50 Ain_r = 8'b10101010; // 170
        #50 Ain_r = 8'b11111111; // 255
        #50 Ain_r = 8'b00000000; // 0
        #50 Ain_r = 8'b10000000; // 128
        #50 Ain_r = 8'b01111111; // 127
    end
    
    // Initial block for Bin stimulus
    initial begin
        // Test various values for Bin
        Bin_r = 8'b00000010;    // 2
        #50 Bin_r = 8'b00001100; // 12
        #50 Bin_r = 8'b01010101; // 85
        #50 Bin_r = 8'b11110000; // 240
        #100 Bin_r = 8'b00000001; // 1
        #100 Bin_r = 8'b11111111; // 255
    end
    
    // Initial block for Carry-in stimulus
    initial begin
        // Test with and without carry-in
        Ci_r = 1'b0;
        #250 Ci_r = 1'b1;
    end
endmodule