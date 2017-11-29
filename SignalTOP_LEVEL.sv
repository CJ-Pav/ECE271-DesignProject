//This module doesn't currently work. The output logic named
//"signal" is a binary variable, and I am trying to assign
//it a real number value. It gets this number and just rounds
//it down to zero. Need to talk to the TAs to fix this
//problem.

//Also, I am assuming that the default timescale is 1ns
//(which it may not be). I couldn't get the 'timescale
//directive to work, so I'm just hoping it will 1ns
//by default.

module signalgenerator(	input logic [8:0] keys,
						input logic reset,
						output logic [7:0] signal);
		
		logic clk;
		logic LUTclk;
		logic LUTsignal;
		
	OSCH #("2.08") osc_int (	//"2.08" specifies the operating frequency, 2.08 MHz.
									//Other clock frequencies can be found in the MachX02's documentation
			.STDBY(1'b0),			//Specifies active state
			.OSC(clk),				//Outputs clock signal to 'clk' net
			.SEDSTDBY());			//Leaves SEDSTDBY pin unconnected
	
	SignalClockDivider(	
			.keys(keys),
			.clk(clk),
			.signalLUTclk(LUTclk));
			
	SignalLUT(	
			.clk(LUTclk),
			.reset(reset),
			.signal(LUTsignal));
	
endmodule