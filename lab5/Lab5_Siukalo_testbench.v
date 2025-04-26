module multiplexer_8to1_tb;
    reg [2:0] A;        // 3-bit select input
    reg D0, D1, D2, D3, D4, D5, D6, D7;  // 8 data inputs
    reg EN;             // Enable control
    wire Q;  // Output
    // Instantiate the Unit Under Test (UUT)
    multiplexer_8to1 uut (
        .A(A),          
        .D0(D0), .D1(D1), .D2(D2), .D3(D3),  
        .D4(D4), .D5(D5), .D6(D6), .D7(D7),
        .EN(EN),        
        .Q(Q)          
    );
    initial begin
        // Initialize all inputs
        D0 = 0; D1 = 1; D2 = 0; D3 = 1; 
        D4 = 0; D5 = 1; D6 = 0; D7 = 1;  
        EN = 1;         // Start with multiplexer disabled
        A = 3'b000;     // Select input 0 (though disabled)
        // Print header for results table
        $display("EN\tA\tQ\tD[7:0]");
        $display("---------------------");
        $monitor("%b\t%b\t%b\t%b%b%b%b%b%b%b%b", 
                EN, A, Q, D7, D6, D5, D4, D3, D2, D1, D0);
        //Initial state (multiplexer disabled)
        #10;
        //Enable multiplexer and test all inputs
        EN = 0;         
        #10;           
        // Sequentially test each input
        #10 A = 3'b000;  // Select D0 (should output 0)
        #10 A = 3'b001;  // Select D1 (should output 1)
        #10 A = 3'b010;  // Select D2 (should output 0)
        #10 A = 3'b011;  // Select D3 (should output 1)
        #10 A = 3'b100;  // Select D4 (should output 0)
        #10 A = 3'b101;  // Select D5 (should output 1)
        #10 A = 3'b110;  // Select D6 (should output 0)
        #10 A = 3'b111;  // Select D7 (should output 1)
        //Disable during operation
        #10;
        EN = 1;         
        A = 3'b010;     // Select D2 (but output should be z)
        #10;           
        //Change inputs while disabled
        D0 = 1; D1 = 0; D2 = 0; D3 = 1;  
        D4 = 1; D5 = 0; D6 = 1; D7 = 0;  
        #10;
        EN = 0;         // Enable again
        #10;
        // End simulation
        #10 $finish;
    end 
endmodule


