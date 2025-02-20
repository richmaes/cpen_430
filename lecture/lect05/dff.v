// Filename: dff.v
// Date: 2/20/25
// Author: Rich Maes
// Description: A more advanced form of the DFF with flexible sync/async reset,
//              parameterizable width.

`include "project_config.vh"           // All instances of the dff.v will load this config file and use the
                                       // the setting inside to control the sync/async feature
`undef ASYNC_RST
`ifdef USE_ASYNC_RST                   // A common coding practice is to CAPITALIZE defines
    `define ASYNC_RST or posedge rst
`endif

module dff
    #(parameter WIDTH)                 // A common coding practice is to CAPITALIZE parameters
    (
        input                  clk,    // By default clk, rst and d are data type wire
        input                  rst,
        input      [WIDTH-1:0] d,
        output reg [WIDTH-1:0] q       // To assign this behaviorly it must be a variable data type, thus declared as reg
    );
    always @ (posedge clk `ASYNC_RST)  // This uses a define to control wheter this is a asynronous reset
        begin                          // or syncronous
           if (rst)
               q <= 1'b0;
           else
               q <= d; 
        end
endmodule
