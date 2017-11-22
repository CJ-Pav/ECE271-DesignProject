//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/04/2016 
// Design Name:    demo2016
// Module Name:    FourDigitSevenSeg
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FourDigitSevenSeg(
 input logic clock_1KHz, reset_n,
 input logic [13:0] displayValue,  	// The value that gets split and displayed on the display, number ranges go 0-9999.
 output logic [6:0] display,     	// 6543210 -> gfedcba 
 output logic [2:0] digitSelect   	// 000 -> LSB, 001, 011, 100
 );
 
logic [3:0] thousands;
logic [3:0] hundreds;
logic [3:0] tens;
logic [3:0] ones;
logic [3:0] value;
logic [1:0] digitCount;

TwoBitCounter i1(
	.clock_1KHz	(clock_1KHz),
	.reset_n	(reset_n),
	.digitCount	(digitCount)
);

DigitTranslator i2(
	.digitCount	(digitCount),
	.digitSelect	(digitSelect)
);

DigitSeparator i3(
	.displayValue	(displayValue),
	.thousands	(thousands),
	.hundreds	(hundreds),
	.tens		(tens),
	.ones		(ones)
);

FourToOneMux i4(
	.thousands	(thousands),
	.hundreds	(hundreds),
	.tens		(tens),
	.ones		(ones),
	.digitCount	(digitCount),
	.value		(value)
);

SevenSeg i5(
	.value		(value),
	.display	(display)
);

endmodule
