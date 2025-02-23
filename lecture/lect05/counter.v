module counter
    #(parameter WIDTH=4)
    (
    input              clk,
    input              rst,
    input              load,
    input  [WIDTH-1:0] data,
    output [WIDTH-1:0] q
    );

    reg [WIDTH-1:0] cnt;                  // This is a storage variable so defined as register

    always @ (posedge clk or posedge rst)
        begin
            if (rst)
                begin
                    cnt <= {WIDTH{1'b0}}; // An interesting way of letting the length of 0's flex to the width.  Helps to avoid warnings
                end
            else
                begin
                    if (load)
                        cnt <= data;
                    else
                        cnt <= cnt + 1; 
                end
        end
    assign q = cnt;                        // Dataflow style coding
endmodule
