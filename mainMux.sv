module mainMux(
	input logic [3:0] thousands, hundreds, tens, ones,
	input logic [2:0] state,
	output logic [3:0] digit
);
	/*parameter S0 = 3'b000; //First digit
	parameter S1 = 3'b001; //Second digit
	parameter S2 = 3'b011; //Third digit
	parameter S3 = 3'b100; //Fourth digit*/
	always_comb
		begin
			case(state)
				3'b000: digit = thousands;
				3'b001: digit = hundreds;
				3'b011: digit = tens;
				3'b100: digit = ones;
			endcase
		end
endmodule
