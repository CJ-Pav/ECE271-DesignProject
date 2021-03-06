module freqMux (
	input logic [8:0] keyFreqIn_fm,
	input logic [8:0] bbFreqIn_fm,
	input logic whichFreqOut,
	output logic [8:0] dataOut_fm
	);

	always_comb
		case (whichFreqOut)
			0: dataOut_fm = keyFreqIn_fm;
			1: dataOut_fm = bbFreqIn_fm;
		endcase
		
endmodule 
