// button look up table #1
// input: buttonBoard output
// output: binary button description

module bLUT1(
    input logic [7:0] buttonBoard,
    output logic [8:0] buttons
    );

    always_comb
        case (buttonBoard)
			'b00000001: buttons = 'b000000001; //Key1
			'b00000010: buttons = 'b000000010; //Key2
			'b00000100: buttons = 'b000000100; //Key3 
			'b00001000: buttons = 'b000001000; //Key4
			'b00010000: buttons = 'b000010000; //Key5
			'b00100000: buttons = 'b000100000; //Key6
			'b01000000: buttons = 'b001000000; //Key7
			'b10000000: buttons = 'b010000000; //Key8
			'b00000000: buttons = 'b100000000; //Key9 (pause)
			default: buttons = 'b100000000; //Key9 (pause)
		endcase
endmodule