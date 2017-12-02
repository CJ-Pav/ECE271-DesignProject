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
			'b00000011: buttonFreq = 'b100000110; //Key3 
			'b00000100: buttonFreq = 'b100100110; //Key4
			'b00000101: buttonFreq = 'b101001010; //Key5
			'b00000110: buttonFreq = 'b101011101; //Key6
			'b00000111: buttonFreq = 'b110001000; //Key7
			'b00001000: buttonFreq = 'b110111000; //Key8
			'b00001001: buttonFreq = 'b000000000; //Key9 (pause)
		endcase

endmodule