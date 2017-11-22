//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/09/2016 
// Design Name:    demo2016
// Module Name:    DigitTranslator
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    A block of combinational logic that will translate the counter value to be correct for the 4 digit hardware.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DigitTranslator(
 input logic [1:0] digitCount,    //11 -> MSB, 00 -> LSB 
 output logic [2:0] digitSelect  //the selected digit
 ); 

  always_comb
    case(digitCount)  		       
      2'd0 : digitSelect = 3'b000;  //MSB Display
      2'd1 : digitSelect = 3'b001;  //Hundreds Display
      2'd2 : digitSelect = 3'b011;  //Tens Display
      2'd3 : digitSelect = 3'b100;  //LSB Display
      default : digitSelect = 0;   
    endcase
endmodule
