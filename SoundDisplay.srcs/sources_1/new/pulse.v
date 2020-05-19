`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2020 15:06:00
// Design Name: 
// Module Name: pulse
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


module pulse(
    input PUSHBUTTON,
    input CLOCK,
    output PULSE
    );
    
    wire Q1;
    wire Q2;
    
    my_dff dff1 (CLOCK, PUSHBUTTON, Q1);
    my_dff dff2 (CLOCK, Q1, Q2);
    
    assign PULSE = (Q1 & ~Q2);
    
endmodule
