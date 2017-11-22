//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/09/2016 
// Design Name:    demo2016
// Module Name:    DigitSeparator
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    A block of combinational logic that will separate a value (0-9999) into digits to be displayed.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DigitSeparator(
 input logic [13:0] displayValue, //
 output logic [3:0] thousands,     //the MSB digit
 output logic [3:0] hundreds,      //the 100's digit
 output logic [3:0] tens,          //the 10's digit
 output logic [3:0] ones          //the LSB digit
 ); 

   assign thousands = (displayValue / 1000) % 10; //MSB Display
   assign hundreds = (displayValue / 100) % 10;
   assign tens = (displayValue / 10) % 10;
   assign ones = displayValue % 10;

endmodule
