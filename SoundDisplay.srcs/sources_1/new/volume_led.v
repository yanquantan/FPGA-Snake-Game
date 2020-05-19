`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2020 15:04:52
// Design Name: 
// Module Name: volume_led
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


module volume_led(
    input CLOCK,
    input [11:0] mic_in,
    output [15:0] led
    );
    
    reg [30:0] COUNT = 31'b0;
        
    always @ (posedge CLOCK) begin
        if (COUNT == 31'b0000000101111101011110000011111)
            COUNT <= 31'b0;
        else
            COUNT <= COUNT + 1;
    end
    
    reg [15:0] LED = 16'b0;
    reg [11:0] max_vol = 12'b0;
    
    always @ (posedge CLOCK) begin
        if (COUNT == 31'b0)
            begin
                LED = 16'b1111111111111111;
                if (max_vol > 2000)
                    begin
                        LED = LED << (max_vol - 2000)/((4095 - 2000)/17);
                    end
                max_vol = 12'b0;
            end
        else
            begin
                if (mic_in > max_vol)
                    max_vol <= mic_in;
            end
    end
    
    assign led = ~LED;
    
endmodule
