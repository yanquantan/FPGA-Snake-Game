`timescale 1ns / 1ps

module circle_visualiser(
    input clk20k,
    input [11:0] mic_in,
    input [12:0] pixel_index,
    output reg [15:0] oled_data
    );
    
    reg [12:0] counter;
    reg [5:0] radius, max_radius; // from 0 to 48
    reg [11:0] max_mic;
    
    reg [6:0] x, new_x; 
    reg [5:0] y, new_y;
    
    reg [15:0] screen_colour = 16'b11111_111111_11111, dim_colour = 16'b01111_011111_01111;
    reg [15:0] random_colour, random_dim_colour;
    reg [2:0] colour_type;
    
    always @ mic_in begin
        colour_type = mic_in % 6;
        case (colour_type)
            0: begin
                random_colour = {5'b00000, mic_in[4:0], 1'b0, 5'b11111};
                random_dim_colour = {5'b00000, 1'b0, mic_in[4:1], 1'b0, 5'b01111};
            end
            1: begin
                random_colour = {5'b00000, 5'b11111, 1'b0, mic_in[4:0]};
                random_dim_colour = {5'b00000, 5'b01111, 1'b0, 1'b0, mic_in[4:1]};
            end
            2: begin
                random_colour = {mic_in[4:0], 5'b00000, 1'b0, 5'b11111};
                random_dim_colour = {1'b0, mic_in[4:1], 5'b00000, 1'b0, 5'b01111};
            end
            3: begin
                random_colour = {mic_in[4:0], 5'b11111, 1'b0, 5'b00000};
                random_dim_colour = {1'b0, mic_in[4:1], 5'b01111, 1'b0, 5'b00000};
            end
            4: begin
                random_colour = {5'b11111, 5'b00000, 1'b0, mic_in[4:0]};
                random_dim_colour = {5'b01111, 5'b00000, 1'b0, 1'b0, mic_in[4:1]};
            end
            5: begin
                random_colour = {5'b11111, mic_in[4:0], 1'b0, 5'b00000};
                random_dim_colour = {5'b01111, 1'b0, mic_in[4:1], 1'b0, 5'b00000};
            end
        endcase
    end
    
    always @ pixel_index begin
        oled_data = dim_colour;
        x = pixel_index % 96; // [0:95]
        y = pixel_index / 96; // [0:63]
        
        if (x < 48) new_x = 96 - x;
        else new_x = x;
        
        if (y < 32) new_y = 64 - y;
        else new_y = y;
        
        if ( (new_x - 48) * (new_x - 48) + (new_y - 32) * (new_y - 32) < radius * radius) oled_data = screen_colour;
    end
    
    always @ (posedge clk20k) begin
        if (counter[8:0] == 0) begin
            radius = (max_mic - 2048) / 43;
            
            if (counter == 0 && max_radius > 35) begin
                screen_colour <= random_colour;
                dim_colour <= random_dim_colour;
                
                max_radius = 0;
            end
            
            max_radius = (radius > max_radius) ? radius : max_radius;
            
            max_mic = 0;
        end
        
        max_mic = (mic_in > max_mic) ? mic_in : max_mic;
    
        counter = (counter[8:0] == 399) ? {counter[12:9]+1, 9'b0} : counter + 1;
    end
endmodule
