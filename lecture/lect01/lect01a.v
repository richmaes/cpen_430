// mux.sv
// Converted from VHDL to SystemVerilog

module mux(
    input  wire A,
    input  wire B,
    input  wire S,
    output wire Z
);
    initial 
        begin
            $display("%0t, INFO: Mux using abstraction level style",$time);
        end

    // Internal nets for intermediate signals
    wire SN;
    wire ASN;
    wire SB;

    // Instantiate the inverter to generate the complement of S
    INV U1   (
        .A(S),
        .F(SN)
    );

    // Instantiate the first AND gate: ASN = A & ~S
    AND2 U2 (
        .A(A),
        .B(SN),
        .F(ASN)
    );

    // Instantiate the second AND gate: SB = B & S
    AND2 and2_b_inst (
        .A(S),
        .B(B),
        .F(SB)
    );

    // Instantiate the OR gate to combine the two paths: Z = ASN | SB
    OR2 or2_inst (
        .A(ASN),
        .B(SB),
        .F(Z)
    );

endmodule


// Inverter module: Implements F = ~A
module INV(
    input  wire A,
    output wire F
);
    assign F = ~A;
endmodule


// 2-input AND gate module: Implements F = A & B
module AND2(
    input  wire A,
    input  wire B,
    output wire F
);
    assign F = A & B;
endmodule


// 2-input OR gate module: Implements F = A | B
module OR2(
    input  wire A,
    input  wire B,
    output wire F
);
    assign F = A | B;
endmodule
