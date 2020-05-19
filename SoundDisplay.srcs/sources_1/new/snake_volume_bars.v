`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2020 17:13:57
// Design Name: 
// Module Name: snake_volume_bars
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


module snake_volume_bars(
    input CLK100MHZ,
    input [15:0] lpf_led_out,
    input [15:0] hpf_led_out,
    input [12:0] pixel_index,
    input [15:0] snake_oled_data,
    output reg [15:0] combined_oled_data
    );
    
    reg [15:0] black = 16'b00000_000000_00000;
    reg [15:0] red = 16'b11111_000000_00000;
    reg [15:0] green = 16'b00000_111111_00000;
    
    reg [6:0] x; 
    reg [5:0] y;
    
    integer i;
    
    always @ (posedge CLK100MHZ) begin
        if (snake_oled_data != 0) begin
            combined_oled_data = snake_oled_data; //copy snake_oled_data if it's already coloured
        end
        else begin
            combined_oled_data = 0;
            x = pixel_index % 96; // [0:95]
            y = pixel_index / 96; // [0:63]
            
            if (x < 15) begin
                for (i = 0; i < 16; i = i + 1) begin
                    if (y == (8 + 3 * i) || y == (9 + 3 * i)) begin
                        if (i < 8) begin
                            combined_oled_data = (lpf_led_out[15-i]) ? red : black;
                        end
                        else begin
                            combined_oled_data = (lpf_led_out[15-i]) ? green : black;
                        end
                    end
                end
            end
            
            if (x > 81) begin
                for (i = 0; i < 16; i = i + 1) begin
                    if (y == (8 + 3 * i) || y == (9 + 3 * i)) begin
                        if (i < 8) begin
                            combined_oled_data = (hpf_led_out[15-i]) ? red : black;
                        end
                        else begin
                            combined_oled_data = (hpf_led_out[15-i]) ? green : black;
                        end
                    end
                end
            end
        end
    end
    
endmodule
