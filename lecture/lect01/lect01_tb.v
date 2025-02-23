// Filename lect01_tb.v
// Date: 2/20/25
// Author: Rich Maes
// Description:
// A testbench for multiple mux designs using an case based internal model 
// for comparison and a error counting.  

module lect01_tb();


reg A, B, S;
wire Z;
reg  Zt;  // The simulation prediction logic variable
reg [31:0] num_errors;
reg [31:0] i;


initial 
    begin
        num_errors = 0;
        for (i = 0; i < 8; i = i + 1)
            begin
                B = i[0];
                A = i[1];
                S = i[2];
                #1;
                $display("%0t: S=%X, A=%x, B=%x, Z=%x", $time, S,A,B,Z);
                if (Zt !== Z) 
                    begin
                        $display("%0t, ERROR: Z:%x does not match Zt:%x",$time,Z,Zt);
                        num_errors = num_errors + 32'h1;
                    end 
                #10;
            end
            $display("%0t, Test %s with %0d errors.", $time, num_errors > 0 ? "FAILS" : "PASSES", num_errors); 
            $finish();
    end

mux u_dut
    (
    .A(A),
    .B(B),
    .S(S),
    .Z(Z)
    );


// An alternat method to cross check the design.... These had better match or something is up....
always @ (*)
    begin
    case({S,A,B})
        3'b000: Zt = 1'b0;
        3'b001: Zt = 1'b0;
        3'b010: Zt = 1'b1;
        3'b011: Zt = 1'b1;
        3'b100: Zt = 1'b0;
        3'b101: Zt = 1'b1;
        3'b110: Zt = 1'b0;
        3'b111: Zt = 1'b1;
    endcase
    end
endmodule

