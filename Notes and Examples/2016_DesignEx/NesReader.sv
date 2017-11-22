//////////////////////////////////////////////////////////////////////////////////
// Company:        Oregon State University
// Engineer:       Matthew Shuman
// 
// Create Date:    04/04/2016 
// Design Name:    demo2016
// Module Name:    NesReader 
// Project Name:   
// Target Devices: MachX02
// Tool versions:  Lattice Diamond 3.7
// Description:    a description of the controller for the NES can be found here:
//                         http://seb.riot.org/nescontr/
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module NesReader(
  input logic dataYellow,
  input logic clock,
  input logic reset_n,
  output logic latchOrange,
  output logic clockRed,
  output logic up,
  output logic down,
  output logic left,
  output logic right,
  output logic start,
  output logic select,
  output logic a,
  output logic b
  );
  logic [3:0] count;

  Counter4 matt_i1(
    .clk               (clock), 
    .reset_n           (reset_n), 
    .count             (count)
  );

  NesClockStateDecoder matt_i2(
    .controllerState  (count), 
    .nesClock         (clockRed)
  );

  NesLatchStateDecoder matt_i3 (
    .controllerState  (count), 
    .nesLatch         (latchOrange)
  );

  NesDataReceiverDecoder matt_i4 (
    .dataYellow       (dataYellow), 
    .reset_n           (reset_n),
    .controllerState  (count), 
    .readButtons      ({a, b, select, start, up, down, left, right})
  );
endmodule


module Counter4(
  input logic clk, reset_n,
  output logic [3:0] count);

  always_ff @ (posedge clk, negedge reset_n)
    if(!reset_n) count <= 4'b0;
    else count <= count + 1;
endmodule


module NesLatchStateDecoder(
  input logic [3:0] controllerState,
  output logic nesLatch);

  always_comb
    case(controllerState)
      4'h0: nesLatch = 1;
      default: nesLatch = 0;
    endcase
endmodule


module NesClockStateDecoder(
  input logic [3:0] controllerState,
  output logic nesClock);

  always_comb
    case (controllerState)
      4'h2: nesClock = 1;
      4'h4: nesClock = 1;
      4'h6: nesClock = 1;
      4'h8: nesClock = 1;
      4'ha: nesClock = 1;
      4'hC: nesClock = 1;
      4'hE: nesClock = 1;
      default: nesClock = 0;
    endcase
endmodule


module NesDataReceiverDecoder(
  input logic dataYellow,
  input logic reset_n,
  input logic [3:0] controllerState,
  output logic [7:0] readButtons); 

  always_ff @ (posedge controllerState[0], negedge reset_n)
    if(!reset_n) readButtons <= 8'b0;
    else case(controllerState[3:0])
      4'h1: readButtons[7] <= dataYellow;	//a button
      4'h3: readButtons[6] <= dataYellow;	//b button
      4'h5: readButtons[5] <= dataYellow;	//select button
      4'h7: readButtons[4] <= dataYellow;	//start button
      4'h9: readButtons[3] <= dataYellow;	//up button
      4'hB: readButtons[2] <= dataYellow;	//down button
      4'hD: readButtons[1] <= dataYellow;	//left button
      4'hF: readButtons[0] <= dataYellow;	//right button
      default: readButtons <= readButtons;
    endcase
endmodule
