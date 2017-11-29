module register(
    input logic inData,             //data line from ps2 keyboard
    input logic inKeyClk,           //clock line from ps2 keyboard
    input logic regReset,           //set to 1 every 11 ticks
    input logic sysCount,           //tracks clock ticks
    input logic sysClock,           //clock running state machine
    output logic [10:0] outData,    //bus to decoder
	output logic outKeyClk          //clock to keyboard
	);

    reg [10:0] rawData;

    count = 0;

    always_ff@(posedge inKeyClk) begin      //keyboard clock line drives the module
        sysCount <= sysCount + 1;           //count += 1

        if(sysCount == 11)  begin           //writes to decoder every 11 clock ticks
            outData <= reg;                 //pass the now full register along bus to decoder
            reset <= 1;                     //set the reset
        end

        if(reg == 'b0ddddddddd1) begin      //check for start and stop bits
            reg[sysCount] <= inData;        //this line will probably not work
        end

        if(regReset) begin                  //if reset is set
            sysCount <= 0;                  //set count to 0
            regReset <= 0;                  //reset the reset
        end

    end

    

endmodule