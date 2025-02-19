module irst #(
    parameter RST_DLY=3
    ) 
    (
    input clk,
    output rst
    );
    bit [7:0] rstdly;  // Type bit resolves X's and Z's to zero.  Good for simulation initialization.
    logic rst_d;
    always @ (posedge clk)
        begin
            rstdly <= (RST_DLY === rstdly) ? RST_DLY : rstdly + 8'h01;
            rst_d  <= rst;
            if (rst_d  & (RST_DLY === rstdly)) begin
                $display("%0t, Deasserting reset", $time);
            end 
        end

    assign rst = rstdly !== RST_DLY; 

endmodule
