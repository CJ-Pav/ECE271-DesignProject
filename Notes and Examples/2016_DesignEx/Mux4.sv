//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/10/2016 
// Design Name:    demo2016
// Module Name:    Mux4
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    A clean 4x1 MUX, for single bit lines
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux4(
 input logic [1:0] clockSelect, 
 input logic zero, one, two, three,
 output logic out
 ); 

  always_comb
    case(clockSelect)  		       
      2'd3 : out = three; 	
      2'd2 : out = two; 
      2'd1 : out = one;      
      2'd0 : out = zero;      
      default : out = zero;   
    endcase
endmodule
