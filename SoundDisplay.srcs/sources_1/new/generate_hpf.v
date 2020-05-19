`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2020 00:37:24
// Design Name: 
// Module Name: generate_hpf
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


module generate_hpf(
    input [15:0] normal_led_out,
    input [15:0] lpf_led_out,
    output reg [15:0] hpf_led_out
    );
    
    reg [4:0] lpf_vol, normal_vol, hpf_vol;
    integer j, k;
    
    always @ (*) begin
        lpf_vol = 0;
        normal_vol = 0;
        
        for (j = 0; j < 16; j = j + 1) begin
            if (lpf_led_out[j] == 1) begin
                lpf_vol = j + 1;
            end
            if (normal_led_out[j] == 1) begin
                normal_vol = j + 1;
            end
        end
        
        hpf_vol = (normal_vol < lpf_vol) ? 0 : (normal_vol - lpf_vol);
        
        hpf_led_out = 0;
        
        for (k = 0; k < 16; k = k + 1) begin
            if (k < hpf_vol) begin
                hpf_led_out[k] = 1;
            end
            else begin
                hpf_led_out[k] = 0;
            end
        end
    end
    
endmodule
