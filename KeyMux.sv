module keyMux (
	input logic [8:0] keyDecMuxIn,
	output logic [8:0] whichKeyOut
);
	always_comb
		case (keyDecMuxIn)
			'b000000001: 				//Key1
			'b000000010:  				//Key2
			'b000000100:  				//Key3 
			'b000001000:  				//Key4
			'b000010000:  				//Key5
			'b000100000:  				//Key6
			'b001000000: 			 	//Key7
			'b010000000:  				//Key8
			'b100000000:  				//Key9
		endcase
endmodule 