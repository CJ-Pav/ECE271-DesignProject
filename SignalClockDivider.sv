module SignalClockDivider(	input logic [8:0] keys,
							input logic clk,
							output logic signalLUTclk);
	int count;
	logic [6:0] counter;
	
	always_comb
		case(keys) 
			9'b100000000: count = 2080000 / (220*128);
			9'b010000000: count = 2080000 / (246.94*128);
			9'b001000000: count = 2080000 / (261.63*128);
			9'b100100000: count = 2080000 / (293.67*128);
			9'b100010000: count = 2080000 / (329.63*128);
			9'b100001000: count = 2080000 / (349.23*128);
			9'b100000100: count = 2080000 / (392.00*128);
			9'b100000010: count = 2080000 / (440.00*128);
			9'b100000001: count = 999999;
		endcase
	
	always_ff @(posedge clk, posedge reset) 
		if (counter == count)
			begin
				counter <= 0;
				signalLUTclk <= !signalLUTclk;
			end
		else counter <= counter + 1; 
endmodule