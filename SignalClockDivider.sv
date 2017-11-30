//This module takes the 2 Mhz clock and the output from
//The decoder and outputs a slow clock whose speed
//Depends on which button/key was pressed.
module SignalClockDivider(	input logic [8:0] keys,
							input logic clk, reset,
							output logic signalLUTclk);
	int count, counter;
	
	//Lookup table that determines how many cycles of the 2.08 Mhz 
	//clock it takes to complete one cycle of the slow clock.
	//Values like 220, 246.94 etc are frequences of the musical
	//Notes that the speaker is supposed to generate.
	//1050 is twice the number of entries in the lookup table.
	always_comb
		case(keys) 
			9'b100000000: count = 2080000 / (220*1050);
			9'b010000000: count = 2080000 / (246.94*1050);
			9'b001000000: count = 2080000 / (261.63*1050);
			9'b100100000: count = 2080000 / (293.67*1050);
			9'b100010000: count = 2080000 / (329.63*1050);
			9'b100001000: count = 2080000 / (349.23*1050);
			9'b100000100: count = 2080000 / (392.00*1050);
			9'b100000010: count = 2080000 / (440.00*1050);
			9'b100000001: count = 999999;
		endcase
	
	//This is the counter that actually generates the slow clock
	always_ff @(posedge clk, posedge reset) 
		if(reset) begin counter <= 0; signalLUTclk <= 0; end
		else if (counter == count)
			begin
				counter <= 0;
				signalLUTclk <= !signalLUTclk;
			end
		else counter <= counter + 1; 
endmodule