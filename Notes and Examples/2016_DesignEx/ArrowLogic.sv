//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/10/2016 
// Design Name:    demo2016
// Module Name:    ArrowLogic
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    A block of combinational logic that controls the direction the counter counts.
//		   A -> up, B -> down, neither button or both buttons -> don't count.
//		   NES controller buttons are active low.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ArrowLogic(
 input logic a, b, countClock, 
 output logic ud, countClockEnabled  //the selected digit
 ); 

  assign countClockEnabled = (~a | ~b) & countClock;  //only let the clock through if a or b is a logic zero.
  assign ud = ~a & b;				// count up only if A is pushed and B is not pushed.

endmodule
