//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/09/2016 
// Design Name:    demo2016
// Module Name:    SevenSeg 
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    A clean SevenSegment display driver
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SevenSeg(
 input logic [3:0] value,  //the input to display
 output logic [6:0] display// a, b, c, d, e, f, g, the individual LED output for the seven segment along with the digital point
 ); 

  always_comb
    case(value)		//	  gfedcba All LEDs are active low
      4'd0 : display = 7'b1000000; //display 0
      4'd1 : display = 7'b1111001; //display 1
      4'd2 : display = 7'b0100100; //display 2
      4'd3 : display = 7'b0110000; //display 3
      4'd4 : display = 7'b0011001; //display 4
      4'd5 : display = 7'b0010010; //display 5
      4'd6 : display = 7'b0000010; //display 6
      4'd7 : display = 7'b1111000; //display 7
      4'd8 : display = 7'b0000000; //display 8
      4'd9 : display = 7'b0010000; //display 9
      default : display = 7'b0111111; //dash
    endcase
endmodule
