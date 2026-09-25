`timescale 1ns / 1ps

module doubdab_8bits(input [7:0] b_in, output [11:0] bcd_out);

//
// Fill in the connections and wires to implement the double-dabble algorithm
//  
//   
	integer i;

	always @(*) begin

	bcd_out = 0; // make empty

	for (i = 7; i >= 0; i = i - 1) begin // need to decrement because of how doubole dabble interacts
		
                if (bcd_out[11:8] >= 5) begin
                        bcd_out[11:8] = bcd_out[11:8] + 3;
		end
		if (bcd_out[7:4] >= 5) begin
			bcd_out[7:4] = bcd_out[7:4] + 3;
                end
		if (bcd_out[3:0] >= 5) begin
                        bcd_out[3:0] = bcd_out[3:0] + 3;
		end

		bcd_out = bcd_out << 1; // pushes a zero to the left end of the bcd array, also removes rightmost end "MSB"
		bcd_out[0] = b_in[i]; // sets the newest index 0 to whatever the next MSB of b_in is
	end
	end

/* ngl, im not sure why we were supposed to use this
	dd_add3 u1 ();
	dd_add3 u2 ();
	dd_add3 u3 ();
	dd_add3 u4 ();
	dd_add3 u6 ();
	dd_add3 u5 ();
	dd_add3 u7 ();
*/
endmodule
