//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    05/11/2016 
// Design Name:    demo2016
// Module Name:    TopLevel 
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    Top Level for connecting a NES controller to a counter that is displayed on a 4 digit display.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module TopLevel(
  input logic dataYellow,
  output logic latchOrange, clockRed,
  input logic reset_n,
  output logic [6:0] display,
  output logic [2:0] digitSelect
);
	
logic up, down, left, right, a, b;
logic ud, countClock;
logic [1:0]clockSelect;
logic clock_16Hz, clock_32Hz, clock_128Hz, clock_1KHz, clock_2KHz, clock_16KHz;
logic [13:0] count;
			
//This is an instance of a special, built in module that accesses our chip's oscillator
OSCH #("2.08") osc_int (	//"2.08" specifies the operating frequency, 2.08 MHz. Other clock frequencies can be found in the MachX02's documentation
  .STDBY(1'b0),			//Specifies active state
  .OSC(clock_2MHz),			//Outputs clock signal to 'clk' net
  .SEDSTDBY()			//Leaves SEDSTDBY pin unconnected
);							
		
		
//This module is instantiated from another file, 'NesReader.sv'
NesReader reader1(
  .dataYellow(dataYellow),
  .reset_n(reset_n),
  .latchOrange(latchOrange),
  .clockRed(clockRed),
  .up(up),
  .down(down),
  .left(left),
  .right(right),
  .a(a),
  .b(b),
  .clock(clock_32KHz)
);

//This module is instantiated from another file, 'ClockDivider'
ClockDivider Divider1(
  .clock_2MHz(clock_2MHz),	// the clock driving the counter
  .reset_n(reset_n),		// active low reset	
  .clock_1MHz(clock_1MHz),	// 
  .clock_512KHz(clock_512KHz),	// 
  .clock_256KHz(clock_256KHz),	// 
  .clock_128KHz(clock_128KHz),	// 
  .clock_64KHz(clock_64KHz),	// 
  .clock_32KHz(clock_32KHz),	// 
  .clock_16KHz(clock_16KHz),	// 
  .clock_8KHz(clock_8KHz),	// 
  .clock_4KHz(clock_4KHz),	// 
  .clock_2KHz(clock_2KHz),	// 
  .clock_1KHz(clock_1KHz),	// 
  .clock_512Hz(clock_512Hz),	// 
  .clock_256Hz(clock_256Hz),	// 
  .clock_128Hz(clock_128Hz),	// 
  .clock_64Hz(clock_64Hz),	// 
  .clock_32Hz(clock_32Hz),	// 
  .clock_16Hz(clock_16Hz),	// 
  .clock_8Hz(clock_8Hz),	// 
  .clock_4Hz(clock_4Hz),	// 
  .clock_2Hz(clock_2Hz),	// 
  .clock_1Hz(clock_1Hz) 	// 
);			
		
//This module is instantiated from another file, 'PriorityEncoder.sv'
PriorityEncoder Encoder1(
  .up(up),
  .down(down),
  .left(left),
  .right(right),
  .clockSelect(clockSelect)
);

//This module is instantiated from another file, 'Mux4.sv'
Mux4 Mux1(
  .clockSelect(clockSelect),
  .zero(clock_16Hz),
  .one(clock_32Hz),
  .two(clock_128Hz),
  .three(clock_2KHz),
  .out(countClock)
);

//This module is instantiated from another file, 'ArrowLogic.sv'
ArrowLogic Combo1(
  .a(a),
  .b(b),
  .countClock(countClock),
  .ud(ud),
  .countClockEnabled(countClockEnabled)
);

//This module is instantiated from another file, 'Counter14.sv'
Counter14 Counter1(
  .reset_n(reset_n),
  .upDown(ud),
  .clock(countClockEnabled),
  .count(count)
);

//This module is instantiated from another file, 'FourDigitSevenSeg.sv'
FourDigitSevenSeg(
  .reset_n(reset_n),
  .displayValue(count),
  .clock_1KHz(clock_1KHz),
  .display(display),
  .digitSelect(digitSelect)
);

		
endmodule
