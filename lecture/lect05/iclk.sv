module iclk #(
    parameter int tH,
              int tL
    )  
    (
    output clk
    );

    bit clk_w;
    // Initialize the clock
    initial begin
      clk_w = 0;
      forever begin
        #tL clk_w = 1;
        #tH clk_w = 0;
      end
    end

    assign clk = clk_w;

endmodule

