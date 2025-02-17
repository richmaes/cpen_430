// mux.sv
// Converted from VHDL to SystemVerilog

module mux(
    input  logic A,
    input  logic B,
    input  logic S,
    output logic Z
);

    // Internal nets for intermediate signals
    logic s_bar;
    logic a_and;
    logic b_and;

    // Instantiate the inverter to generate the complement of S
    INV inv_inst (
        .A(S),
        .F(s_bar)
    );

    // Instantiate the first AND gate: a_and = A & ~S
    AND2 and2_a_inst (
        .A(A),
        .B(s_bar),
        .F(a_and)
    );

    // Instantiate the second AND gate: b_and = B & S
    AND2 and2_b_inst (
        .A(B),
        .B(S),
        .F(b_and)
    );

    // Instantiate the OR gate to combine the two paths: Z = a_and | b_and
    OR2 or2_inst (
        .A(a_and),
        .B(b_and),
        .F(Z)
    );

endmodule


// Inverter module: Implements F = ~A
module INV(
    input  logic A,
    output logic F
);
    assign F = ~A;
endmodule


// 2-input AND gate module: Implements F = A & B
module AND2(
    input  logic A,
    input  logic B,
    output logic F
);
    assign F = A & B;
endmodule


// 2-input OR gate module: Implements F = A | B
module OR2(
    input  logic A,
    input  logic B,
    output logic F
);
    assign F = A | B;
endmodule
