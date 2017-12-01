// sync module

module sync (
    input logic reset, keyClk1, sysClk,
    output logic keyClk2
    )

    logic [4:0] count;

    assign keyClk1 = sysClk;
    assign keyClk2 = keyClk1;

    always_ff @ (posedge sysClk) begin
        if(reset) begin
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
        reset <= 0;
    end

endmodule