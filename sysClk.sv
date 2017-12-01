// 2.08 MHz Clock

module sysClk(
    output logic clkValue,
    input logic reset
    );
    
    logic clk;

    assign clkValue = clk;

    OSCH #("2.08") osc_int (
        .STDBY(1'b0),
        .OSC(clk),
        .SEDSTDBY());

endmodule