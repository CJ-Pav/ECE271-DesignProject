//the God module 

module topModule (
	reg ps2Data;
	input logic [1:0] keyClk, // come back to it	
	input logic [7:0] buttonBoard,
	input logic sysClk, 
    output logic [6:0] segments
);
	//register internal logics
	logic sysCount;
	logic regReset;
	logic [10:0] regOutData;
	logic outKeyClk; 
	
	//key decoder internal logics
	logic [10:0] keyDecIndata;
	logic [8:0] keyDecOutData;

	//signalgenerator internal logics
	logic [8:0] keys;
	logic [7:0] signal;

	//key LUT internal logics 
    input logic [8:0] keys;
	output logic [8:0] keyFreq;

sync clkSync (
	
);

/***************************
 register module
 inputs: ps2Data
	 keyClk  
 output: 11-bit data line to key_decoder 
**************************/
Register reg (
	.regInData(ps2Data),      // data line 
	.inKeyClk(ps2Clk),     // input keyboard clk  
	.regReset(regReset),   // 
	.sysCount(sysCount),
	.sysClock(sysClk),     // 
	.regOutData(outData),     // output logi
	.outKeyClk(outKeyClk)  // clk to keyboard 
);

/***************************
 key decoder, determines which key is pressed
 inputs: ps2Data  
 output: 9-bit data line to key_decoder 
**************************/
KeyDecoder KD (
	.keyDecInData(regOutData);
	.keyDecOutData(keyDecOutData); // 9-bit output (play, pause, 28 Hz ... 49 Hz, NextState)	
);

signalgenerator (
	.keys(keyDecOutData);	
	.signal(signal);
);


// determine the frequency
subDecoder (
    
);

// sysClk to FSM  
sysClkMod (
	.ps2Clk(ps2Clk),
);

state_machine FSM (
	
);


signalgenerator (

);

mux m (

);

state_machine FSM (

);

endmodule
