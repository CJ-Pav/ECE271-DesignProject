//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/10/2016 
// Design Name:    demo2016
// Module Name:    ClockDivider
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    Clock divider that reduces the 2.08 MHz clock to more useful frequencies.  The unused portions of the counter will be eliminated by the synthesizer.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ClockDivider(
  input logic clock_2MHz,	// the clock driving the counter
  input logic reset_n,		// active low reset	
  output logic clock_1MHz, 	// 
  output logic clock_512KHz, 	// 
  output logic clock_256KHz, 	// 
  output logic clock_128KHz, 	// 
  output logic clock_64KHz, 	// 
  output logic clock_32KHz, 	// 
  output logic clock_16KHz, 	// 
  output logic clock_8KHz, 	// 
  output logic clock_4KHz, 	// 
  output logic clock_2KHz, 	// 
  output logic clock_1KHz, 	// 
  output logic clock_512Hz, 	// 
  output logic clock_256Hz, 	// 
  output logic clock_128Hz, 	// 
  output logic clock_64Hz, 	// 
  output logic clock_32Hz, 	// 
  output logic clock_16Hz, 	// 
  output logic clock_8Hz, 	// 
  output logic clock_4Hz, 	// 
  output logic clock_2Hz, 	// 
  output logic clock_1Hz 	// 
  ); 

  logic [20:0] count;

  always_ff@(posedge clock_2MHz, negedge reset_n)
    if   (!reset_n)	count <= 0;
    else 	   	count <= count + 1;

  assign clock_1MHz = count[0];	// 
  assign clock_512KHz = count[1];	// 
  assign clock_256KHz = count[2];	// 
  assign clock_128KHz = count[3];	// 
  assign clock_64KHz = count[4];	// 
  assign clock_32KHz = count[5];	// 
  assign clock_16KHz = count[6];	// 
  assign clock_8KHz = count[7];	// 
  assign clock_4KHz = count[8];	// 
  assign clock_2KHz = count[9];	// 
  assign clock_1KHz = count[10];	// 
  assign clock_512Hz = count[11];	// 
  assign clock_256Hz = count[12];	// 
  assign clock_128Hz = count[13];	// 
  assign clock_64Hz = count[14];	// 
  assign clock_32Hz = count[15];	// 
  assign clock_16Hz = count[16];	// 
  assign clock_8Hz = count[17];	// 
  assign clock_4Hz = count[18];	// 
  assign clock_2Hz = count[19];	// 
  assign clock_1Hz = count[20]; 

endmodule
