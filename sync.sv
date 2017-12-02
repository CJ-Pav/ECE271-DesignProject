// sync module

module sync (
    input logic keyClk1, sysClk, reset,
    output logic keyClk2, regReset
    );

    logic [4:0] count = 0;

    assign keyClk1 = sysClk;
    assign keyClk2 = keyClk1;
	
    always_ff @ (posedge sysClk) begin
        if(regReset) begin
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
        regReset <= 0;
    end

endmodule