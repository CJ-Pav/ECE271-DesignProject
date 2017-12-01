module register(
input logic regInData,                      //data line from ps2 keyboard
    input logic clk,                        //clock line from ps2 keyboard
    input logic regReset,                   //set to 1 every 11 ticks
    input logic sysCount,                   //tracks clock ticks
    output logic [10:0] regOutData,         //bus to decoder
    otuput logic sysReset                   //sends reset to 
	);

    logic sysCount
    reg [10:0] rawData;

    count = 0;

    always_ff @ (posedge clk) begin         //keyboard clock line drives the module
        sysCount <= sysCount + 1;           //count += 1

        if(sysCount == 11)  begin           //writes to decoder every 11 clock ticks
            ragOutData <= rawData;          //pass the now full register along bus to decoder
            regReset <= 1;                  //set the reset
        end

        if(reg == 'b0ddddddddd1) begin      //check for start and stop bits
            rawData <= rawData >> 1;        //shift data right
            rawData[0] <= regInData;        //pass data to first bit of register

        end

        if(regReset) begin                  //if reset is set
            sysCount <= 0;                  //set count to 0
            regReset <= 0;                  //reset the reset
        end
    end

endmodule