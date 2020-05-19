`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2020 18:10:01
// Design Name: 
// Module Name: rand_x_y
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


module rand_x_y(
    input CLOCK, eat, start,
    output [6:0] x, y
    );
    
    reg [399:0] list = 400'b0101101011100100100010001001000000000111100101010101011001101101110100110101101100011111010010101010111110001110110011111101010000010101101101110101010011111111100110000100110010101000110000101001011001010000000001010110111011010101010011000101010100010111111100011101110010110110111010101000010110110101001010101010101010001010001011111111111000011100110010001000000111101010010101000010101010101010;
    reg temp;
    
    always @ (posedge CLOCK) begin
        if (start || eat) begin
            temp = list[399];
            list = list << 1;
            list = list + temp;
        end
    end
    
    assign x = (list[256:250]%30)*2 + 18;
    assign y = (list[64:58]%30)*2 + 2;
        
endmodule
