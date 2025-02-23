`timescale 1ns/1ps

module mux_tb;

  // Signal declarations
  logic a;
  logic b;
  logic s;
  logic z;
  // Tesbench checking logic
  logic zt;
  logic [31:0] num_errors;

  // Instantiate the DUT (Device Under Test)
  mux dut (
    .a(a),
    .b(b),
    .s(s),
    .z(z)
  );

  // Testbench stimulus
  initial begin
    num_errors = 32'h0;
    // Test vector 1
    a = 0; b = 0; s = 0;
    #100;
    void'(validate_z(.z(z),.zt(zt)));   // <-- void' lets you ignore the return value without a compiler warning. ;)
    
    // Test vector 2
    a = 0; b = 0; s = 1;
    #100;
    void'(validate_z(.z(z),.zt(zt)));
    
    // Test vector 3
    a = 0; b = 1; s = 0;
    #100;
    void'(validate_z(.z(z),.zt(zt)));
    
    // Test vector 4
    a = 0; b = 1; s = 1;
    #100;
    void'(validate_z(.z(z),.zt(zt)));
    
    // Test vector 5
    a = 1; b = 0; s = 0;
    #100;
    void'(validate_z(.z(z),.zt(zt)));
    
    // Test vector 6
    a = 1; b = 0; s = 1;
    #100;
    void'(validate_z(.z(z),.zt(zt)));
    
    // Test vector 7
    a = 1; b = 1; s = 0;
    #100;
    void'(validate_z(.z(z),.zt(zt)));
    
    // Test vector 8
    a = 1; b = 1; s = 1;
    #100;
    void'(validate_z(.z(z),.zt(zt)));
    
    // End simulation
    $display("%0t, Test %s with %0d errors.", $time, num_errors > 0 ? "FAILS" : "PASSES", num_errors); 
    $display("End of TestBench");

    $finish;
  end


 

  // THIS IS TESTBENCH VERIFICATION LOGIC

  assign zt = s ? b : a;

  function validate_z(input z, input zt);
      if (z === zt)
          begin
              $display("%0t, INFO: Mux Z:%x match expected Zt:%x", $time,z,zt);
          end
      else
          begin  
              $display("%0t, ERROR: Mux Z:%x match expected Zt:%x", $time, z, zt);
              num_errors = num_errors + 32'h1;
          end
       return 0;
  endfunction

endmodule

