module calculator (
           input [1:0]    OP, // OP, last two switches 8 & 9
           input [3:0]    A, B, // A and B are both designated switches on the board, A 0-3, B 4-7
           output [9:0]    out // led output on the board, 0-9, the last two being the "flags"
           );

   wire                cout, ovf;  // carry_out and overflow
   wire [3:0]            outa;  // adder output
   wire [7:0]            outm;  // multiplier output

   addsub4 u_addsub4(
       .A(A),
       .B(B),
       .subsel(OP[0]),
       .X(outa),
       .cout(cout),
       .ovf(ovf)
   );

   mult4 u_mult4(
       .A(A),
       .B(B),
       .X(outm)
   );

   mux10 u_mux10(
       .in0({6'b0, outa}),
       .in1({2'b0, outm}),
       .sel(OP[1]),
       .out(out)
   );

endmodule // calculator
