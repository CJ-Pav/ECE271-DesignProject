// button look up table #2
// input: buttonBoard output
// output: frequency description

module bLUT2(
    input logic [7:0] buttonBoard,
    output logic [8:0] buttonFreq
    )

    always_comb
        case (buttonBoard)
			'b00000001: buttons = 'b011011100; //Key1
			'b00000010: buttons = 'b011110111; //Key2
			'b00000011: buttons = 'b100000110; //Key3 
			'b00000100: buttons = 'b100100110; //Key4
			'b00000101: buttons = 'b101001010; //Key5
			'b00000110: buttons = 'b101011101; //Key6
			'b00000111: buttons = 'b110001000; //Key7
			'b00001000: buttons = 'b110111000; //Key8
			'b00001001: buttons = 'b000000000; //Key9 (pause)
		endcase
endmoduled