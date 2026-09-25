module mult4 (
         input [3:0] A, B,
         output [7:0] X
         );

   wire [7:0] p0, p1, p2, p3;
   wire [7:0] sum1, sum2;
   wire c1_low, c2_low, c3_low;
   wire unused_c1_high, unused_c2_high;
   wire unused_c3_high;

   assign p0 = B[0] ? {4'b0000, A} : 8'b0;
   assign p1 = B[1] ? {3'b000, A, 1'b0} : 8'b0;
   assign p2 = B[2] ? {2'b00, A, 2'b00} : 8'b0;
   assign p3 = B[3] ? {1'b0, A, 3'b000} : 8'b0;

   add4 u_sum1_low(
       .carryin(1'b0), .X(p0[3:0]), .Y(p1[3:0]),
       .S(sum1[3:0]), .carryout(c1_low), .ovf()
   );
   add4 u_sum1_high(
       .carryin(c1_low), .X(p0[7:4]), .Y(p1[7:4]),
       .S(sum1[7:4]), .carryout(unused_c1_high), .ovf()
   );

   add4 u_sum2_low(
       .carryin(1'b0), .X(sum1[3:0]), .Y(p2[3:0]),
       .S(sum2[3:0]), .carryout(c2_low), .ovf()
   );
   add4 u_sum2_high(
       .carryin(c2_low), .X(sum1[7:4]), .Y(p2[7:4]),
       .S(sum2[7:4]), .carryout(unused_c2_high), .ovf()
   );

   add4 u_product_low(
       .carryin(1'b0), .X(sum2[3:0]), .Y(p3[3:0]),
         .S(X[3:0]), .carryout(c3_low), .ovf()
   );
   add4 u_product_high(
         .carryin(c3_low), .X(sum2[7:4]), .Y(p3[7:4]),
       .S(X[7:4]), .carryout(unused_c3_high), .ovf()
   );

endmodule // mult4
