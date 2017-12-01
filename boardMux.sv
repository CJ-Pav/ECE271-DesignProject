module boardMux (
	input logic [8:0] keyFreq_bm,
	input logic [8:0] bbFreq_bm,
	output logic [8:0] dataOut_bm,
	input logic whichBoard
	);

	always_comb
		case (whichBoard)
			0: dataOut_bm = keyFreq_bm;
			1: dataOut_bm = bbFreq_bm;
		endcase

endmodule 

