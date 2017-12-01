module state_machine( //example of a Moore type state machine
	input logic clk_i,
	input logic reset_n,
	
	output logic [2:0] state //The state outputted by this state machine
		);
		
		//next state register
		logic [2:0] state_n;
		
		//each possible value of the state register is given a unique name for easier use later
		parameter S0 = 3'b000; //First digit
		parameter S1 = 3'b001; //Second digit
		parameter S2 = 3'b011; //Third digit
		parameter S3 = 3'b100; //Fourth digit

		//asynchronous reset will set the state to the start, S0, otherwise, the state is changed
		//on the positive edge of the clock signal
		always_ff @ (posedge clk_i, negedge reset_n)
			begin
				if(!reset_n)
					state = S0;
				else
					state = state_n;

			end

		//this section defines what the next state should be for each possible state. in this
		//implementation, it simply rotates through each state automatically
		always_ff @ (*)
			begin
				case(state)
					S0: state_n = S1;
					S1: state_n = S2;
					S2: state_n = S3;
					S3:	state_n = S0;
					
					
					
					default: state_n = S0;
				endcase
			end
endmodule
