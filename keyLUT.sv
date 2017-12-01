// keyLUT
// convert keyboard output to a frequency for 7-seg display

module keyLUT (
    input logic [8:0] keys,
    output logic [8:0] keyFreq
    );

    always_comb
        case (keys)
            'b000000001: keyFreq = 'b011011100; //Key1
			'b000000010: keyFreq = 'b011110111; //Key2
			'b000000100: keyFreq = 'b100000110; //Key3 
			'b000001000: keyFreq = 'b100100110; //Key4
			'b000010000: keyFreq = 'b101001010; //Key5
			'b000100000: keyFreq = 'b101011101; //Key6
			'b001000000: keyFreq = 'b110001000; //Key7
			'b010000000: keyFreq = 'b110111000; //Key8
			'b100000000: keyFreq = 'b000000000; //Key9    
        endcase
		
endmodule