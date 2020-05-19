`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2020 20:44:11
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


module snake_output_decimal(
    input [4:0] len,
    output [7:0] cath_1, cath_2
    );
    
    assign cath_1 = (len == 31) ? 8'b11111001 :
                    (len == 30) ? 8'b11000000 :
                    (len == 29) ? 8'b10010000 : 
                    (len == 28) ? 8'b10000000 :
                    (len == 27) ? 8'b11111000 :
                    (len == 26) ? 8'b10000010 :
                    (len == 25) ? 8'b10010010 : 
                    (len == 24) ? 8'b10011001 :
                    (len == 23) ? 8'b10110000 :
                    (len == 22) ? 8'b10100100 : 
                    (len == 21) ? 8'b11111001 :
                    (len == 20) ? 8'b11000000 :
                    (len == 19) ? 8'b10010000 : 
                    (len == 18) ? 8'b10000000 :
                    (len == 17) ? 8'b11111000 :
                    (len == 16) ? 8'b10000010 :
                    (len == 15) ? 8'b10010010 : 
                    (len == 14) ? 8'b10011001 :
                    (len == 13) ? 8'b10110000 :
                    (len == 12) ? 8'b10100100 : 
                    (len == 11) ? 8'b11111001 :
                    (len == 10) ? 8'b11000000 :
                    (len == 9) ? 8'b10010000 : 
                    (len == 8) ? 8'b10000000 :
                    (len == 7) ? 8'b11111000 :
                    (len == 6) ? 8'b10000010 :
                    (len == 5) ? 8'b10010010 : 
                    (len == 4) ? 8'b10011001 :
                    (len == 3) ? 8'b10110000 :
                    8'b10100100;
                    
    assign cath_2 = (len >= 30) ? 8'b10110000 :
                    (len >= 20) ? 8'b10100100 :
                    (len >= 10) ? 8'b11111001 :
                    8'b11000000;

endmodule
