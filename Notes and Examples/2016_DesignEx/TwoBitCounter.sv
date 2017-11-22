//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/09/2016 
// Design Name:    demo2016
// Module Name:    TwoBitCounter 
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    Two bit counter to cycle through the displayed digits.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TwoBitCounter(
 input logic clock_1KHz,	// the input to display
 input logic reset_n,		// active low reset	
 output logic [1:0] digitCount 	// counts 00, 01, 10, 11, 00
 ); 

  always_ff@(posedge clock_1KHz, negedge reset_n)
    if   (!reset_n)  digitCount <= 0;
    else             digitCount <= digitCount + 1;
endmodule
