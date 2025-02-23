module shiftcomp (
  input  wire         clk,
  input  wire         rst,
  input  wire         load,
  input  wire [7:0]   init,
  input  wire [7:0]   test,
  output wire         limit
);

  // Internal net to connect the shifter and comparator.
  wire [7:0] q_net;

  // Instantiate the comparator module.
  compare COMP_1 (
    .A(q_net),
    .B(test),
    .EQ(limit)
  );

  // Instantiate the shifter module.
  shifter SHIFT_1 (
    .clk(clk),
    .rst(rst),
    .load(load),
    .data(init),
    .Q(q_net),
    .Qb()    // Unconnected output, equivalent to VHDL's "open".
  );

endmodule
