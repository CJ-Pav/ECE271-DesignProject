// register module

module register(
	input logic regInData,                  //data line from ps2 keyboard
    input logic clk,                        //clock line from ps2 keyboard
    input logic sysReset,                   //set to 1 every 11 ticks
    output logic [10:0] regOutData         	//bus to decoder
	);
	
	logic reset;
    logic sysCount;                   		//tracks clock ticks
    reg [10:0] rawData;						//stores register data
	
    always_ff @ (posedge clk) begin         //keyboard clock line drives the module
		
		if(sysReset) begin
			reset <= sysReset;
		end
        
		if(!reset) begin                  	//if reset is set
			sysCount <= sysCount + 1;   	//count += 1
		end
		
        if(sysCount == 11)  begin           //writes to decoder every 11 clock ticks
            regOutData <= rawData;          //pass the now full register along bus to decoder
            reset <= 1;                  	//set the reset
        end

        if(rawData == 'b0XXXXXXXXX1) begin	//check for start and stop bits
            rawData <= rawData >> 1;        //shift data right
            rawData[0] <= regInData;        //pass data to first bit of register
        end

        if(reset) begin                  	//if reset is set
            sysCount <= 0;                  //set count to 0
            reset <= 0;                  	//reset the reset
        end
    end

endmodule
