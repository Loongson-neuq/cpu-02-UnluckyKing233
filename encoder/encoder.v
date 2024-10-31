`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 09:18:21
// Design Name: 
// Module Name: encoder
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


module encoder(
    input [7:0] in,
    output reg [2:0] out
    );
    always @(*) begin
        case (in)
        8'b00000001:out = 3'b000;
        8'b00000010:out = 3'b001;
        8'b00000011:out = 3'b010;
        8'b00000100:out = 3'b011;
        8'b00000101:out = 3'b100;
        8'b00000110:out = 3'b101;
        8'b00000111:out = 3'b110;
        8'b00001000:out = 3'b111;
        endcase
    end
        
        
    
endmodule
 
