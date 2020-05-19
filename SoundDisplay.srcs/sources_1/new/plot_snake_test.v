`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2020 14:19:59
// Design Name: 
// Module Name: plot_snake_test
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


module plot_snake_test(
    input SLOW_CLOCK, start, left_pulse, right_pulse,
    input [12:0] pixel_index,
    output [15:0] oled_data,
    output [4:0] length
    );
    
    reg [1:0] dir = 0;
    reg [6:0] snakeX[0:31];
    reg [6:0] snakeY[0:31];
    integer count1, count2, count3, count4;
    reg found, hit_body;
    reg [6:0] pixX, pixY;
    wire [6:0] appleX, appleY;
    reg [4:0] len;
    reg snake_body, snake_head, apple, border, eat, die;
    
    rand_x_y R(SLOW_CLOCK, eat, start, appleX, appleY);
    
    always @ (posedge SLOW_CLOCK) begin
        eat = 0;
        
        if (left_pulse == 1)
            dir = dir - 1;
        else if (right_pulse == 1)
            dir = dir + 1;
        
        if (start) begin
            for(count1 = 0; count1 < 32; count1 = count1+1) begin
                snakeX[count1] = 32;
                snakeY[count1] = 60 + 2*count1; // changed to * 2
                len = 3;
            end
            dir = 0;
        end
        else if (~start && ~die) begin
            for(count2 = 31; count2 > 0; count2 = count2 - 1) begin
                snakeX[count2] = snakeX[count2 - 1];
                snakeY[count2] = snakeY[count2 - 1];
            end
            
            case(dir)
                0: snakeY[0] = (snakeY[0] - 2);
                1: snakeX[0] = (snakeX[0] + 2);
                2: snakeY[0] = (snakeY[0] + 2);
                3: snakeX[0] = (snakeX[0] - 2);
            endcase
        end
        
        hit_body = 0;
        for(count4 = 1; count4 < len; count4 = count4 + 1) begin
            if (~hit_body)           
                hit_body = (snakeX[0] == snakeX[count4] && snakeY[0] == snakeY[count4]);
        end
        
        if (snakeX[0] == 16 || snakeX[0] == 78 || snakeY[0] == 0 || snakeY[0] == 62 || hit_body)
            die = 1;
        else
            die = 0;
            
        if (snakeX[0] == appleX && snakeY[0] == appleY) begin
            eat = 1;
            if (len < 31)
                len = len + 1;
        end
        else
            eat = 0;
    end
    
    always @ (*) begin
        found = 0;
        pixX = pixel_index%96;
        pixY = pixel_index/96;
        
        for(count3 = 1; count3 < len; count3 = count3 + 1) begin
            if (~found) begin                
                snake_body = ((pixX == snakeX[count3] || pixX == snakeX[count3] + 1) && (pixY == snakeY[count3] || pixY == snakeY[count3] + 1));
                found = snake_body;
            end
        end
        
        border = (pixX == 16 || pixX == 17 || pixX == 78 || pixX == 79 || ((pixY == 0 || pixY == 1 || pixY == 62 || pixY == 63) && (pixX > 16 && pixX < 78)));
        snake_head = ((pixX == snakeX[0] || pixX == snakeX[0] + 1) && (pixY == snakeY[0] || pixY == snakeY[0] + 1));
        apple = ((pixX == appleX || pixX == appleX + 1) && (pixY == appleY || pixY == appleY + 1));
    end
    
    assign oled_data =  border ? 16'b0000000000011111 :
                        (snake_body || snake_head) ? (die ? 16'b1111111111111111 : 16'b0000011111100000) :
                        apple ? 16'b1111100000000000 : 16'b0;
    assign length = len;
    
endmodule






