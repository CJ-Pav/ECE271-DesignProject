//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/10/2016 
// Design Name:    demo2016
// Module Name:    14BitCounter 
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    14 bit counter to cycle through the possible values to display on the 4 digit display.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Counter14(
  input logic clock,		// the clock driving the counter
  input logic reset_n,		// active low reset	
  input logic upDown,		// 1=up, 0=down
  output logic [13:0] count 	// counts 00, 01, 10, 11, 00
  ); 

  always_ff@(posedge clock, negedge reset_n)
    if   (!reset_n)  count <= 0;
    else if(upDown)  count <= count + 1;
    else             count <= count - 1;
endmodule
