// sync module

module sync (
    input logic keyClk1, sysClk, reset,
    output logic keyClk2, regReset
    );

    logic [4:0] count = 0;

    assign keyClk1 = sysClk;
    assign keyClk2 = keyClk1;
	
    always_ff @ (posedge sysClk) begin
<<<<<<< HEAD
        if(regReset) begin
=======
        if(reset) begin
            if(!regReset) begin
                regReset <= reset;
            end
            else begin
                regReset <= 0;
            end
>>>>>>> 82ce044182139577b4a6bb4b6a121a9b2cbc2f41
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
    end

endmodule