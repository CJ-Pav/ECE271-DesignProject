// decoder for 7 seg

module segDecoder(
	input logic [3:0] displayIn, //inputs
	output logic [6:0] segs //display value from parser
	);
	
	always_comb
		case (displayIn)
			0: segs = ~'b0111111;
			1: segs = ~'b0000110;
			2: segs = ~'b1011011;
			3: segs = ~'b1001111;
			4: segs = ~'b1100110;
			5: segs = ~'b1101101;
			6: segs = ~'b1111101;
			7: segs = ~'b0000111;
			8: segs = ~'b1111111;
			9: segs = ~'b1110011;
		endcase
endmodule
