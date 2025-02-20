`timescale 1ps/1ps
module dff_tb;
    wire clk;
    reg rst;
    reg d;
    wire q_async;
    wire q_sync;
    wire [255:0] q_wide;

    // This is a module instance of a non-synthesizeable clock genrator.
    // this can only be used for simulation purposes.
    iclk #(.tH(100),.tL(100)) u_iclk (.clk(clk));

    initial 
        begin
            d = 1'b1;
            rst = 1'b0;
            #1700
            rst = 1'b1;
            #550
            rst = 1'b0;
            repeat (10) @ (posedge clk);
            //@ (negedge clk);
            #50   // Move the time away from the clock edge to help show the async reset more clearly
            rst = 1'b1;
            repeat (5) @ (posedge clk);
            //@ (negedge clk);
            #50   // Move the time away from the clock edge to help show the async reset more clearly
            rst = 1'b0;
            repeat (5) @ (posedge clk);


            $finish(); // This is a built in simulation task.  It causes the simulator to exit
        end

    // The asyncronous version of the DFF module 
    dff_async u_dff_async
        (.clk(clk),
         .rst(rst),
         .d(d),
         .q(q_async)
         );

    // The syncronous version of the DFF module 
    dff_sync u_dff_sync
        (.clk(clk),
         .rst(rst),
         .d(d),
         .q(q_sync)
         );

    // The flexible version of the DFF module set to 256 bits wide
    dff 
    #(.WIDTH(256))
        u_dff
        (.clk(clk),
         .rst(rst),
         .d({256{d}}),
         .q(q_wide)
         );

endmodule
