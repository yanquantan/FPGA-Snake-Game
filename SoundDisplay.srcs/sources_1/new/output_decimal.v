`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2020 16:34:58
// Design Name: 
// Module Name: output_decimal
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


module output_decimal(
    input [15:0] LED,
    output [7:0] cath_1, cath_2
    );
    
    assign cath_1 = LED[15] ? 8'b10010010 : 
                    LED[14] ? 8'b10011001 :
                    LED[13] ? 8'b10110000 :
                    LED[12] ? 8'b10100100 : 
                    LED[11] ? 8'b11111001 :
                    LED[10] ? 8'b11000000 :
                    LED[9] ? 8'b10010000 : 
                    LED[8] ? 8'b10000000 :
                    LED[7] ? 8'b11111000 :
                    LED[6] ? 8'b10000010 :
                    LED[5] ? 8'b10010010 : 
                    LED[4] ? 8'b10011001 :
                    LED[3] ? 8'b10110000 :
                    LED[2] ? 8'b10100100 : 
                    LED[1] ? 8'b11111001 :
                    8'b11000000;
                    
    assign cath_2 = LED[10] ? 8'b11111001 : 8'b11000000;
    
endmodule
