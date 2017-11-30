// decoder module
// the binary values were converted from the hex scan codes posted 
//      in ECE271-DesignProject/Notes and Examples/PS2_Keyboard/ScanCodes.pdf
// this reads in a case (1 through 0 keys on keyboard) and strips out the middle 8 bits,
//		and associates them with a frequency, which is passed in 8-bits to the output
// to implement multiple input boards, we will have a state machine that goes to the
//		next state on a key input (will be one of these next inputs on each board)
// will have to write state logic, for the most part this should just be a mux (case(state))

module KeyDecoder(
	input logic [10:0] keyDecInData, //raw keyboard data
	output logic [8:0] keyDecOutData, //display value for parser
	);
	
	always_comb
		case (keyDecInData)
			'b00001011001: keyDecOutData = 'b000000001; //Key1
			'b00001111011: keyDecOutData = 'b000000010; //Key2
			'b00010011001: keyDecOutData = 'b000000100; //Key3 
			'b00010010101: keyDecOutData = 'b000001000; //Key4
			'b00010111011: keyDecOutData = 'b000010000; //Key5
			'b00011011011: keyDecOutData = 'b000100000; //Key6
			'b00011110101: keyDecOutData = 'b001000000; //Key7
			'b00011111001: keyDecOutData = 'b010000000; //Key8
			'b00100011001: keyDecOutData = 'b100000000; //Key9
		endcase
endmoduled