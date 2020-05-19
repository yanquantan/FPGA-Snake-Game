`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2020 15:27:29
// Design Name: 
// Module Name: graphical_visualisation
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


module graphical_visualisation(
    input CLOCK,
    input [12:0] pixel_index,
    input [15:0] led_in,
    input [15:0] sw,
    output reg [15:0] oled_data
    );
    
    reg [6:0] x; 
    reg [5:0] y;
    reg [15:0] black, white, red, green, yellow;
    reg [6:0] bar_left, bar_right;
    reg thick_border, border_off, bar_off, long_bar, color_0, color_1; // sw[1] to sw[6]
    reg [15:0] led;
    
    integer i; // for loop
    
    always @ (posedge CLOCK) begin
        if (sw[7] == 0) begin
            led = led_in;
            thick_border = sw[1];
            border_off = sw[2];
            bar_off = sw[3];
            long_bar = sw[4];
            color_0 = sw[5];
            color_1 = sw[6];
        end
    
        case ({color_1, color_0})
            2'b00: begin
                black = 16'b00000_000000_00000;
                white = 16'b11111_111111_11111;
                red = 16'b11111_000000_00000;
                green = 16'b00000_111111_00000;
                yellow = 16'b11111_111111_00000;
            end
            2'b01: begin
                black = 16'b00000_000000_00000;
                white = 16'b11111_111111_11111;
                red = 16'b11111_000000_00000;
                green = 16'b00000_000000_11111;
                yellow = 16'b11111_000000_11111;
            end
            2'b10: begin
                black = 16'b11111_111111_11111;
                white = 16'b00000_000000_00000;
                red = 16'b00000_000000_11111;
                green = 16'b00000_111111_00000;
                yellow = 16'b00000_111111_11111;
            end
            2'b11: begin
                black = 16'b11111_111111_11111;
                white = 16'b00000_000000_00000;
                red = 16'b11111_000000_00000;
                green = 16'b00000_111111_00000;
                yellow = 16'b11111_111111_00000;
            end
        endcase
    
        case (long_bar)
            0: begin
                bar_left = 35;
                bar_right = 60;
            end
            1: begin
                bar_left = 29;
                bar_right = 66;
            end
        endcase
    
        oled_data = black;
    
        x = pixel_index % 96; // [0:95]
        y = pixel_index / 96; // [0:63]
        
        if (border_off == 0) begin // border on
            if (thick_border == 0 && (x == 0 || y == 0 || x == 95 || y == 63)) begin // thin border
                oled_data = white;
            end
            else if (thick_border == 1 && (x < 3 || y < 3 || x > 92 || y > 60)) begin // thick border
                oled_data = white;
            end
        end
        
        if (bar_off == 0 && x > bar_left && x < bar_right) begin // volume bar on
            for (i = 0; i < 16; i = i + 1) begin
                if (y == (8 + 3 * i) || y == (9 + 3 * i)) begin
                    case (i)
                        0: oled_data = (led[15-i]) ? red : black;
                        1: oled_data = (led[15-i]) ? red : black;
                        2: oled_data = (led[15-i]) ? red : black;
                        3: oled_data = (led[15-i]) ? red : black;
                        4: oled_data = (led[15-i]) ? red : black;
                        5: oled_data = (led[15-i]) ? yellow : black;
                        6: oled_data = (led[15-i]) ? yellow : black;
                        7: oled_data = (led[15-i]) ? yellow : black;
                        8: oled_data = (led[15-i]) ? yellow : black;
                        9: oled_data = (led[15-i]) ? yellow : black;
                        10: oled_data = (led[15-i]) ? yellow : black;
                        11: oled_data = (led[15-i]) ? green : black;
                        12: oled_data = (led[15-i]) ? green : black;
                        13: oled_data = (led[15-i]) ? green : black;
                        14: oled_data = (led[15-i]) ? green : black;
                        15: oled_data = (led[15-i]) ? green : black;
                    endcase
                end
            end
        end
    end
    
endmodule
