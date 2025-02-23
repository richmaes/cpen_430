module iclk #(
    parameter tH = 5,
              tL = 5
    )  
    (
    output clk
    );

    reg clk_w;
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

