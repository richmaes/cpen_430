// mux.sv
// Converted from VHDL to SystemVerilog

module mux(
    input  logic A,
    input  logic B,
    input  logic S,
    output logic Z
);
    initial 
        begin
            $display("%0t, INFO: Mux using current coding style",$time);
        end

   // Truth table 
   // case({S,A,B})
   //     3'b000: Z = 1'b0;
   //     3'b001: Z = 1'b0;
   //     3'b010: Z = 1'b1;
   //     3'b011: Z = 1'b1;
   //     3'b100: Z = 1'b0;
   //     3'b101: Z = 1'b1;
   //     3'b110: Z = 1'b0;
   //     3'b111: Z = 1'b1;
   // endcase
    	
  // Terinary statement
  assign Z = ~S ? A : B;

endmodule
