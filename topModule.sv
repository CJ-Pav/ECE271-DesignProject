//the God module 

module topModule (
	input logic ps2data, // 1 byte input from PS2, one at a time
	input logic [1:0] keyClk, // come back to it	
	input logic [7:0] buttonBoard,
	//input logic sysClk, 
    //output logic [6:0] segments,
	output logic [7:0] signal
);

/***************************
All internal variables:
***************************/
	//sync
	logic keyClk2;
	logic regReset;
	//sysClk
	logic sysClkReset;
	logic clkValue;
	//2.08MHz CLK
	logic oscClk;
	//register
	logic [10:0] regOutData;
	//keyDecoder
	logic [8:0] keyDecOutData;
	//bLUT1
	logic [8:0] buttons;
	//freqMux
	logic whichFreqOut;
	logic [8:0] dataOut_fm;
	//signalgenerator
	logic signalGeneratorReset;
	logic signalGeneratorClk;
	//keyLUT
	logic [8:0] keys;
	logic [8:0] keyFreq;
	//bLUT2
	logic [8:0] buttonFreq;
	//boardMux
	logic whichBoard;
	logic [8:0] dataOut_bm;
	//digitalseparator
	logic [3:0] thousands, hundreds, tens, ones;
	//state_machines
	logic [2:0] state; 
	//mainMux
	logic [3:0] displayDigit;
	
	
//------------------------------------------------------------------------//
	//logic keyClk2;
	//logic regReset;
	sync clkSync (
		.reset(regReset), //output
		.keyClk2(keyClk2), //output 
		.keyClk1(keyClk), 
		.sysClk(clkValue)
	);
//------------------------------------------------------------------------//
	//logic sysClkReset;
	//logic clkValue;
	sysClk sysClkMod (
		.reset(sysClkReset), 
		.clkValue(clkValue) //output 
	);
//------------------------------------------------------------------------//
	//logic oscClk;
	OSCH #("2.08") osc_int (		//2.08 MHz CLK
									//Other clock frequencies can be found in the MachX02's documentation
			.STDBY(1'b0),			//Specifies active state
			.OSC(oscClk),			//Outputs clock signal to 'clk' net
			.SEDSTDBY() 
	);								//Leaves SEDSTDBY pin unconnected
//------------------------------------------------------------------------//	
	//logic [10:0] regOutData;
	register reg (
		.regInData(ps2Data),    
		.clk(keyClk2),        
		.sysReset(regReset),     
		.regOutData(regOutData) //output
	);
//------------------------------------------------------------------------//	
	//logic [8:0] keyDecOutData;
	KeyDecoder KD (
	.keyDecInData(regOutData),
	.keyDecOutData(keyDecOutData) //output
);

//------------------------------------------------------------------------//
	//logic [8:0] buttons;
	bLUT1 b1(
		.buttonBoard(buttonBoard),
		.buttons(buttons) //output
	);
//------------------------------------------------------------------------//
	//logic whichFreqOut;
	//logic [8:0] dataOut_fm;
	freqMux fm (
		.keyFreqIn(keyDecOutData),
		.bbFreqIn(buttons),
		.dataOut(dataOut_fm),
		.whichFreqOut(whichFreqOut)
	);
		
//------------------------------------------------------------------------//
	//logic signalGeneratorReset;
	//logic signalGeneratorClk;
	signalgenerator sg(
		.keys(dataOut_fm),
		.reset(signalGeneratorReset),
		.clk(signalGeneratorClk),
		.signal(signal)
	)
	
//------------------------------------------------------------------------//
    //logic [8:0] keys;
	//logic [8:0] keyFreq;
	keyLUT key_LUT(
		.keys(dataOut_fm),
		.keyFreq(keyFreq)
	);

//------------------------------------------------------------------------// 
	//logic [8:0] buttonFreq;
	bLUT2 b2(
		.buttonBoard(buttonBoard),
		.buttonFreq(buttonFreq)
	);
	
//------------------------------------------------------------------------//
	//logic whichBoard;
	//logic [8:0] dataOut_bm;
	boardMux bm (
		.keyFreqIn_bm(keyFreq),
		.bbFreqIn_bm(buttonFreq),
		.dataOut_bm(dataOut_bm),
		.whichBoard(whichBoard)
	);
	
//------------------------------------------------------------------------//
	//logic [3:0] thousands, hundreds, tens, ones;
	DigitSeparator (
		.displayValue(dataOut_bm),
		.thousands(thousands),
		.hundreds(hundreds),
		.tens(tens),
		.ones(ones)
	);
//------------------------------------------------------------------------//
	//logic [2:0] state;  
	state_machine( 
		.reset_n(sysClkReset),
		.clk_i(clkValue),
		.state(state)
	);
//------------------------------------------------------------------------//
	//logic [3:0] displayDigit;
	mainMux (
		.state(state),
		.digit(displayDigit),
		.thousands(thousands),
		.hundreds(hundreds),
		.tens(tens),
		.ones(ones)
	);

endmodule
