module mux(
  input  logic a,
  input  logic b,
  input  logic s,
  output logic z
);

  always_comb begin
    if (s == 1'b0)
      z = a;
    else
      z = b;
  end

endmodule
