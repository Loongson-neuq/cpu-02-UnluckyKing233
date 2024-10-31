`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 09:29:52
// Design Name: 
// Module Name: encoder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module encoder_tb;
reg [7:0] in;
wire [2:0] out;
encoder uut(
.in(in),
.out(out)
);
initial
begin
in=8'b00000001;
#10;
in=8'b00000010;
#10;
in=8'b00000011;
#10;
in=8'b00000100;
#10;
in=8'b00000101;
#10;
in=8'b00000110;
#10;
in=8'b00000111;
#10;
in=8'b00000000;
#10;
end

endmodule
