// mux.sv
// Converted from VHDL to SystemVerilog

module mux(
    input  wire A,
    input  wire B,
    input  wire S,
    output wire Z
);
    initial 
        begin // This initial and display are not sythnesizeable - it will not
              // become part of the device.  But it will show which module is 
              // being used in simulation via the logfile.
            $display("%0t, INFO: Mux using current coding style",$time);
        end
                   
  // Terinary statement - Cool because it forces the use of an ELSE clause
  assign Z = ~S ? A : B;   
                       
 endmodule  
