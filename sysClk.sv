// 2.08 MHz Clock

module sysClk(
    output logic clkValue,
    output logic [9:0] count;
    input logic reset
    );
    
    logic clk;

    assign clkValue = clk;

    OSCH #("2.08") osc_int (
        .STDBY(1'b0),
        .OSC(clk),
        .SEDSTDBY());
    
    always_ff@(posedge clk) begin
        if(reset) begin
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
        reset <= 0;
    end

endmodule