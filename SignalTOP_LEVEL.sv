//My top level module for signal generation. Not much to see here honestly.
module signalgenerator(	input logic [8:0] keys,
						input logic reset, clk,
						output logic [7:0] signal);
		
		//logic clk;
		logic LUTclk;
		
	//This is one of those magical built in modules that SystemVerilog gives us	
//	OSCH #("2.08") osc_int (	//"2.08" specifies the operating frequency, 2.08 MHz.
//									//Other clock frequencies can be found in the MachX02's documentation
//			.STDBY(1'b0),			//Specifies active state
//			.OSC(clk),				//Outputs clock signal to 'clk' net
//			.SEDSTDBY());			//Leaves SEDSTDBY pin unconnected
	
	SignalClockDivider divider(	
			.keys(keys),
			.clk(clk),
			.reset(reset),
			.signalLUTclk(LUTclk));
			
	SignalLUT lut(	
			.clk(LUTclk),
			.reset(reset),
			.signal(signal));
	
endmodule