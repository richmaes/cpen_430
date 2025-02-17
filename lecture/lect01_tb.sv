module lect01_tb();


logic A, B, C, Z;

initial 
    begin
        for (int i = 0; i < 8; i = i + 1)
            begin
                A = i[0];
                B = i[1];
                C = i[2];
                #1;
                $display("%0t: A=%x, B=%x, C=%x, Z=%x", $time, A,B,C,Z);
                #10;
            end
            $finish();
    end

mux u_mux(
    .A(A),
    .B(B),
    .S(C),
    .Z(Z)
);

endmodule
