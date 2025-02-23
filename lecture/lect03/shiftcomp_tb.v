module shiftcomp_tb ();
    wire clk;
    wire rst;

    iclk #(5000,5000) u_iclk (.clk(clk));
    irst #(5) u_irst(.clk(clk),.rst(rst));
    initial
        begin
            while(rst) begin
                // Wait for reset to de-assert before starting test
                @(posedge clk);
            end
            #100000;
            $finish();
        end

endmodule
