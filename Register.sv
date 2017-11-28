module register(
    input logic inData,
	input logic inKeyClk, //clock from keyboard
    input logic reset, //set to 1 every 11 ticks
    input logic sysCount,
    input logic sysClock, //clock running state machine
    output logic [10:0] outData,
	output logic outKeyClk //clock to keyboard
	);

    reg [10:0] rawData;

    count = 0;

    always_ff@(posedge sysClk) begin



    end

    always_ff@(posedge inClk) begin
        count = count + 1;

        if(count == 11) begin
            reset = 1;
        end

        reg[count] = inData;

        if(reset == 0) begin
            count == 0;
        end

    end

    

endmodule