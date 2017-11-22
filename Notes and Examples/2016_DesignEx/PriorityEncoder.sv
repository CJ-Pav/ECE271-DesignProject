//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/10/2016 
// Design Name:    demo2016
// Module Name:    PriorityEncoder
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    This priority encoder is from page 204 of the textbook, ARM edition.  NES buttons are active low.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PriorityEncoder(
  input logic up, down, left, right, //
  output logic [1:0] clockSelect 
  ); 

  always_comb
    if			(!down)	clockSelect = 2'b00;
    else if 	(!left)	clockSelect = 2'b01;
    else if 	(!right)clockSelect = 2'b10;
    else if 	(!up)	clockSelect = 2'b11;
	else				clockSelect = 2'b00;
endmodule
