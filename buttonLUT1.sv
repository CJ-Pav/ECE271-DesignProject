// button look up table #1

module bLUT1(
    input logic [7:0] buttonBoard,
    output logic [8:0] buttons
    )

    always_comb
        case (buttonBoard)
			'b00000001: buttons = 'b000000001; //Key1
			'b00000010: buttons = 'b000000010; //Key2
			'b00000011: buttons = 'b000000011; //Key3 
			'b00000100: buttons = 'b000000100; //Key4
			'b00000101: buttons = 'b000000101; //Key5
			'b00000110: buttons = 'b000000110; //Key6
			'b00000111: buttons = 'b000000111; //Key7
			'b00001000: buttons = 'b000001000; //Key8
			'b10000000: buttons = 'b000001001; //Key9 (pause)
		endcase
endmoduled