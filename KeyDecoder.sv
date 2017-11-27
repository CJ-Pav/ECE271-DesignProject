// decoder module
// the binary values were converted from the hex scan codes posted 
//      in ECE271-DesignProject/Notes and Examples/PS2_Keyboard/ScanCodes.pdf
// this reads in a case (0 through 1 on keyboard) and 

module decoder(
	input logic [11:0] inData, //inputs
	output logic [8:0] outData, //display value from parser
	);
	
	always_comb
		case (input)
			0: outData = ~'b01000101;
			1: outData = ~'b;
			2: outData = ~'b;
			3: outData = ~'b;
			4: outData = ~'b;
			5: outData = ~'b;
			6: outData = ~'b;
			7: outData = ~'b;
			8: outData = ~'b;
			9: outData = ~'b;
		endcase
endmodule