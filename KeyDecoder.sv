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
			1: outData = ~'b00010110;
			2: outData = ~'b00011110;
			3: outData = ~'b00100110;
			4: outData = ~'b00100101;
			5: outData = ~'b00101110;
			6: outData = ~'b00110110;
			7: outData = ~'b00111101;
			8: outData = ~'b00111110;
			9: outData = ~'b01000110;
		endcase
endmodule