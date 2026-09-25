`timescale 1ns / 1ps

module mux_4in_8to1 (
	       input [3:0] in0, in1, in2, in3, in4, in5, in6, in7,
	       input [2:0] sel,
	       output reg [3:0] out
	       );

//
// Complete this block
//

    always @(*)
        case(sel)
            0: out = in0;
            1: out = in1;
            2: out = in2;
            3: out = in3;
            4: out = in4;
            5: out = in5;
            6: out = in6;
            7: out = in7;
         endcase


endmodule
