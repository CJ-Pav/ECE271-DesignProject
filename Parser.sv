module DigitSeparator(
  input logic [8:0] displayValue, //
  output logic [3:0] thousands,     //the MSB digit
  output logic [3:0] hundreds,      //the 100's digit
  output logic [3:0] tens,          //the 10's digit
  output logic [3:0] ones          //the LSB digit
 ); 

   assign thousands = (displayValue / 1000) % 10; //MSB Display
   assign hundreds = (displayValue / 100) % 10;
   assign tens = (displayValue / 10) % 10;
   assign ones = displayValue % 10;

endmodule
