module compare (
  input  logic [7:0] A,
  input  logic [7:0] B,
  output logic     EQ
);

    // Notes:
    // Logical Equality: ==
    // This operator compares two values but treats any bits that are X or Z as “don’t care” 

    // Case Equality: ===
    // This operator does an exact comparison.


  // Combinational logic to compare A and B
  always_comb begin
    `ifdef LOGICAL_EQUALITY
    if (A == B)
    `else
    if (A === B)
    `endif
      EQ = 1'b1;
    else
      EQ = 1'b0;
  end


endmodule
