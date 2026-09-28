`timescale 1ns / 1ps

module decode_enb_leds(input [2:0] sel, output reg [7:0] enb_leds);

    always @(*)
        case(sel)
            /* it seems that i was trying to do the wrong thing in the wrnog place
            0: enb_leds = 'b0111111;
            1: enb_leds = 'b0000110;
            2: enb_leds = 'b1101011;
            3: enb_leds = 'b1001111;
            4: enb_leds = 'b1100110;
            5: enb_leds = 'b1101101;
            6: enb_leds = 'b1111101;
            7: enb_leds = 'b0000111;
            8: enb_leds = 'b1111111;
            9: enb_leds = 'b1101111;
            default: enb_leds = 0;
            */

            0: enb_leds = 8'b11111110;
            1: enb_leds = 8'b11111101;
            2: enb_leds = 8'b11111011;
            3: enb_leds = 8'b11110111;
            4: enb_leds = 8'b11101111;
            5: enb_leds = 8'b11011111;
            6: enb_leds = 8'b10111111;
            7: enb_leds = 8'b01111111;
         endcase


endmodule // decode_enb_leds
