module dff_sync
    (
        input      clk, // By default clk, rst and d are data type wire
        input      rst,
        input      d,
        output reg q    // To assign this behaviorly it must be a variable data type, thus declared as reg
    );
    always @ (posedge clk)
        begin
           if (rst)
               q <= 1'b0;
           else
               q <= d; 
        end
endmodule
