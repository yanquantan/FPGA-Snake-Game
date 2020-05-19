`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2020 15:45:45
// Design Name: 
// Module Name: Top_Snake
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


module Top_Snake(
    input CLOCK,
    input [2:0] btn,
    input [12:0] pixel,
    input [3:0] sw,
    output [15:0] oled_data,
    output [3:0] an,
    output [7:0] seg
    );
    
    wire [35:0] SLOW_CLOCK;
    slow_clock SC(CLOCK, SLOW_CLOCK);
    
    wire left_pulse, right_pulse, reset;
    pulse p1(btn[0], SLOW_CLOCK[15], reset);
    pulse p2(btn[1], SLOW_CLOCK[15], left_pulse);
    pulse p3(btn[2], SLOW_CLOCK[15], right_pulse);
    
    wire speed_selector;
    wire E, L, R;
    gen_sig G(CLOCK, speed_selector, reset, left_pulse, right_pulse, E, L, R);
    wire [4:0] len;
    plot_snake_test PST(speed_selector, E, L, R, pixel, oled_data, len);
    snake_seven_seg_display S(SLOW_CLOCK[15], len, an, seg);
    
    assign speed_selector = (sw[3] == 1) ? SLOW_CLOCK[21] :
                            (sw[2] == 1) ? SLOW_CLOCK[22] :
                            (sw[1] == 1) ? SLOW_CLOCK[23] :
                            (sw[0] == 1) ? SLOW_CLOCK[24] :
                            0;
    
endmodule

