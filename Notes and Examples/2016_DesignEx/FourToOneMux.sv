//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/09/2016 
// Design Name:    demo2016
// Module Name:    FourToOneMux
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    A clean 4x1 MUX, for busses of 4 bits
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FourToOneMux(
 input logic [1:0] digitCount,    //11 -> MSB, 00 -> LSB 
 input logic [3:0] thousands,     //the MSB digit
 input logic [3:0] hundreds,      //the 100's digit
 input logic [3:0] tens,          //the 10's digit
 input logic [3:0] ones,          //the LSB digit
 output logic [3:0] value  //the selected digit
 ); 

  always_comb
    case(digitCount)  		       
      2'd3 : value = thousands; //MSB Display
      2'd2 : value = hundreds;  //hundreds Display
      2'd1 : value = tens;      //tens Display
      2'd0 : value = ones;      //LSB Display
      default : value = ones;   //
    endcase
endmodule
