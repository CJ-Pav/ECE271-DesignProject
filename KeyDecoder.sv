// decoder module
// the binary values were converted from the hex scan codes posted 
//      in ECE271-DesignProject/Notes and Examples/PS2_Keyboard/ScanCodes.pdf
// this reads in a case (1 through 0 keys on keyboard) and strips out the middle 8 bits,
//		and associates them with a frequency, which is passed in 8-bits to the output
// to implement multiple input boards, we will have a state machine that goes to the
//		next state on a key input (will be one of these next inputs on each board)
// will have to write state logic, for the most part this should just be a mux (case(state))

module decoder(
	input logic [11:0] inData, //raw keyboard data
	output logic [8:0] outData, //display value for parser
	);
	
	always_comb
		case (inData)
			'b00001011001: outData = ~'b00000001; //Key1 -> play
			'b00001111011: outData = ~'b00000010; //Key2 -> pause
			'b00010011001: outData = ~'b00011100; //Key3 -> 28 Hz
			'b00010010101: outData = ~'b00011111; //Key4 -> 31 Hz
			'b00010111011: outData = ~'b00100001; //Key5 -> 33 Hz
			'b00011011011: outData = ~'b00100101; //Key6 -> 37 Hz
			'b00011110101: outData = ~'b00101001; //Key7 -> 42 Hz
			'b00011111001: outData = ~'b00101100; //Key8 -> 44 Hz
			'b00100011001: outData = ~'b00110001; //Key9 -> 49 Hz
			'b00100010101: outData = ~'b00000000; //Key0 -> NextState (tells FSM to use next board)
		endcase
endmoduled