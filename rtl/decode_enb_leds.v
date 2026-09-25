`timescale 1ns / 1ps

module decode_enb_leds(input [2:0] sel, output reg [7:0] enb_leds);

    always @(*)
        case(sel)
            0: enb_leds 'b0111111;
            1: enb_leds 'b0000110;
            2: enb_leds 'b1101011;
            3: enb_leds 'b1001111;
            4: enb_leds 'b1100110;
            5: enb_leds 'b1101101;
            6: enb_leds 'b1111101;
            7: enb_leds 'b0000111;
            8: enb_leds 'b1111111;
            9: enb_leds 'b1101111;
            default: enb_leds 0;
         endcase


endmodule // decode_enb_leds
