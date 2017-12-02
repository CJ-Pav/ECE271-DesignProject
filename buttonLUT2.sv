// button look up table #2
// input: buttonBoard output
// output: frequency description

module bLUT2(
    input logic [7:0] buttons,
    output logic [8:0] buttonFreq
    );

    always_comb
        case (buttons)
			'b00000001: buttonFreq = 'b011011100; //Key1
			'b00000010: buttonFreq = 'b011110111; //Key2
			'b00000100: buttonFreq = 'b100000110; //Key3 
			'b00001000: buttonFreq = 'b100100110; //Key4
			'b00010000: buttonFreq = 'b101001010; //Key5
			'b00100000: buttonFreq = 'b101011101; //Key6
			'b01000000: buttonFreq = 'b110001000; //Key7
			'b10000000: buttonFreq = 'b110111000; //Key8
			'b00000000: buttonFreq = 'b000000000; //Key9 (pause)
			default: buttonFreq = 'b000000000; //Key9 (pause)
		endcase

endmodule