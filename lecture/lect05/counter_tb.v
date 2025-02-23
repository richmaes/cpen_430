`timescale 1ps/1ps
module counter_tb #(
    parameter WIDTH=4
    );

    wire clk;
    wire rst;
    wire[WIDTH-1:0] q_cnt;  // q_cnt is structural hook up to the u_counter, so wire
    reg load;               // The test bench use load and data as driving variables
    reg [WIDTH-1:0] data;   // so they are assigned as register

       

    // This is a module instance of a non-synthesizeable clock genrator.
    // this can only be used for simulation purposes.
    iclk #(.tH(100),.tL(100)) u_iclk (.clk(clk));
    irst u_irst(.clk(clk), .rst(rst));


    function info_msg
        (
         input load,
         input [WIDTH-1:0] q_cnt
        ); 
        begin
        $display("%0t, load = %0d, q_cnt=%02X",$time,load,q_cnt);
        end
    endfunction

    counter
    #(
        .WIDTH(WIDTH)
    ) u_counter(
        .clk(clk),
        .rst(rst),
        .load(load),
        .data(data),
        .q(q_cnt)
        );

    reg info_rslt;

    initial
        begin

            load = 0;
            data = 0;
            wait (~rst);
             
            info_rslt = info_msg(load,q_cnt);
            repeat (5) @ (posedge clk);
            info_rslt = info_msg(load,q_cnt);
            repeat (17) @ (posedge clk);
            info_rslt = info_msg(load,q_cnt);
            repeat (20) @ (posedge clk);
            info_rslt = info_msg(load,q_cnt);
            repeat (1) @ (posedge clk);
            data = {WIDTH{1'b1}};
            load = 1'b1;
            $display("%0t, Asserting load with data = %02X", $time, data);
            repeat (1) @ (posedge clk);
            load = 1'b0;
            info_rslt = info_msg(load,q_cnt);
            repeat (17) @ (posedge clk);
            $finish();
        end

    
 

endmodule


