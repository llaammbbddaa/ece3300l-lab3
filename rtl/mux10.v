module mux10 (
           input [9:0] in0, in1,
           input sel,
           output reg [9:0] out
           );

   always @(in0, in1, sel) // basically, if mutliplication is selected, the output for the multiplication is chosen to be outputted, otherwise, the addition / subtraction is shown instead
     begin
    if (sel)
      out = in1;
    else
      out = in0;
     end
   
endmodule // mux10
