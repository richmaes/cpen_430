module shifter (
  input  logic         clk,
  input  logic         rst,
  input  logic         load,
  input  logic [7:0]   data,
  output logic [7:0]   Q,
  output logic [7:0]   Qb
);

  // Internal register, declared with the same index order as the VHDL version
  logic [7:0] Qreg;

  // Sequential block with asynchronous reset
  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      Qreg <= 8'b00000000; // Asynchronous reset
    else if (load)
      Qreg <= data;        // load data when load is high
    else
      Qreg <= { Qreg[6:0], Qreg[7] }; // Barrel shift: rotate left by one bit
  end

  // Drive the outputs
  assign Q  = Qreg;
  assign Qb = ~Qreg; // Bitwise NOT of Qreg

endmodule
