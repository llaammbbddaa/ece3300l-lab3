module addsub4 (
           input [3:0] A, B,
           input subsel,
           output [3:0] X,
           output cout, ovf
           );

   wire [3:0] B_xor;

   assign B_xor = B ^ {4{subsel}}; // inverts the bits of B if subtraction is selected

   add4 u_add4(
       .carryin(subsel), // if subtraction is selected it adds the cin, so that way subtraction works, A - B = A + ~B + 1
       .X(A),
       .Y(B_xor),
       .S(X),
       .carryout(cout),
       .ovf(ovf)
   );

endmodule
