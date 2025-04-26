module multiplexer_8to1(
    input [2:0] A,       // 3-bit address input 
    input D0, D1, D2, D3, D4, D5, D6, D7, // 8 individual data inputs
    input EN,            // Enable input
    output reg Q         // Output
);

    always @(*) begin
        if (EN==0) begin       // When EN is active (low)
            case (A)
                3'b000: Q = D0;  // When A=000, output D0
                3'b001: Q = D1;  // When A=001, output D1
                3'b010: Q = D2;  // When A=010, output D2
                3'b011: Q = D3;  // When A=011, output D3
                3'b100: Q = D4;  // When A=100, output D4
                3'b101: Q = D5;  // When A=101, output D5
                3'b110: Q = D6;  // When A=110, output D6
                3'b111: Q = D7;  // When A=111, output D7
            endcase
        end
        // When disabled (EN=1)
        else begin
            Q = 1'bz;  // Set output to high-impedance state
        end
    end
    
endmodule

