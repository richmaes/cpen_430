// mux.sv
// Converted from VHDL to SystemVerilog

module mux(
    input  wire A,
    input  wire B,
    input  wire S,
    output reg  Z
);
    initial 
        begin
            $display("%0t, INFO: Mux using sequential coding style",$time);
        end

  // Sequential coding style
 
   always @ (A,B,S)
       begin
        if (~S)
            begin
                Z = A; // Using Z as storage variable so
            end        // it must be declared as reg.
        else
            begin
                Z = B;
            end
       end
endmodule
