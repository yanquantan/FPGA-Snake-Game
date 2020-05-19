`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): THURSDAY P.M
//
//  STUDENT A NAME: JONATHAN CHUA EN ZHE
//  STUDENT A MATRICULATION NUMBER: A0148165B
//
//  STUDENT B NAME: TAN YAN QUAN
//  STUDENT B MATRICULATION NUMBER: A0150128R
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,   // Connect to this signal from Audio_Capture.v
    
    input CLK100MHZ,
    input [15:0] sw,
    output [15:0] led,
    output reg [7:0] seg,
    output reg [3:0] an,
    
    input btnC,
    input btnU, btnL, btnR,
    output [7:0] JC
    );
    
    // Audio Capture
    wire clk20k;
    wire [11:0] mic_in;
    wire [15:0] led_out;
    reg [11:0] zeros_12 = 12'b0000_0000_0000;
    
    slow_clk_20kHz slow_clk_dev (CLK100MHZ, clk20k);
    Audio_Capture AC_dev (CLK100MHZ, clk20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);

    wire [15:0] normal_led_out;
    wire [3:0] normal_an;
    wire [7:0] normal_seg;
    
    volume_led normal_vol_led_dev(CLK100MHZ, mic_in, normal_led_out); //part 4.2A
    seven_seg_display normal_ssd_dev(clk20k, normal_led_out, normal_an, normal_seg);
    
    //OLED Display
    wire clk6p25m, clk95;
    wire reset;
    reg [15:0] oled_data;
    wire frame_begin, sending_pixels, sample_pixel; // unused wires
    wire [4:0] teststate; // unused wires
    wire [12:0] pixel_index;
    
    clk_6_25_MHz clk_dev1 (CLK100MHZ, clk6p25m);
    pulse pulse_dev (btnC, clk6p25m, reset);
    Oled_Display(clk6p25m, reset, frame_begin, sending_pixels, sample_pixel, pixel_index, oled_data, JC[0], JC[1], JC[3], JC[4], JC[5], JC[6], JC[7],teststate);
    
    wire [15:0] normal_oled_data;
    
    graphical_visualisation normal_GV_dev (CLK100MHZ, pixel_index, normal_led_out, sw, normal_oled_data); // Part 4.2B
    
    // team extension
    wire [15:0] lpf_led_out;
    wire [3:0] lpf_an;
    wire [7:0] lpf_seg;
    wire [11:0] lpf_mic;
    wire [15:0] lpf_oled_data;
    
    lpf lpf_dev (clk20k, mic_in, lpf_mic); //change back to lpf
    volume_led lpf_vol_led_dev(CLK100MHZ, lpf_mic, lpf_led_out);
    seven_seg_display lpf_ssd_dev(clk20k, lpf_led_out, lpf_an, lpf_seg);
    
    graphical_visualisation lpf_GV_dev (CLK100MHZ, pixel_index, lpf_led_out, sw, lpf_oled_data);
    
    // yq extension
    wire [15:0] normal_amplitude_oled_data,lpf_amplitude_oled_data, normal_circle_oled_data,lpf_circle_oled_data;
    amplitude_visualiser normal_AV_dev (clk20k, mic_in, pixel_index, normal_amplitude_oled_data);
    amplitude_visualiser lpf_AV_dev (clk20k, lpf_mic, pixel_index, lpf_amplitude_oled_data);
    
    circle_visualiser normal_CV_dev (clk20k, mic_in, pixel_index, normal_circle_oled_data);
    circle_visualiser lpf_CV_dev (clk20k, lpf_mic, pixel_index, lpf_circle_oled_data);
    
    wire [15:0] hpf_led_out;
    generate_hpf Ghpf_dev (normal_led_out, lpf_led_out, hpf_led_out);
    
    // jon extension
    wire is_low = lpf_led_out[8];
    wire is_high = hpf_led_out[8];
    reg [2:0] btn;
    reg lpf_or_not;
    wire [15:0] snake_oled_data;
    wire [3:0] snake_an;
    wire [7:0] snake_seg;
    wire [15:0] combined_oled_data;
    
    Top_Snake TS_dev(CLK100MHZ, btn, pixel_index, sw[13:10], snake_oled_data, snake_an, snake_seg);
    
    snake_volume_bars SVB_dev(CLK100MHZ, lpf_led_out, hpf_led_out, pixel_index, snake_oled_data, combined_oled_data);
    
    assign led = sw[0] ? {4'b0000, mic_in} : led_out;
    
    always @ (posedge CLK100MHZ) begin
        case ({sw[15], sw[14], sw[8]})
            3'b000: begin
                an = normal_an;
                seg = normal_seg;
                oled_data = normal_oled_data;
            end
            3'b001: begin
                an = normal_an;
                seg = normal_seg;
                oled_data = sw[9] ? normal_circle_oled_data : normal_amplitude_oled_data;
            end
            3'b100: begin
                an = lpf_an;
                seg = lpf_seg;
                oled_data = lpf_oled_data;
            end
            3'b101: begin
                an = lpf_an;
                seg = lpf_seg;
                oled_data = sw[9] ? lpf_circle_oled_data : lpf_amplitude_oled_data;
            end
            3'b010: begin
                an = snake_an;
                seg = snake_seg;
                oled_data = snake_oled_data;
                btn = {btnR, btnL, btnU};
            end
            3'b011: begin
                an = snake_an;
                seg = snake_seg;
                oled_data = snake_oled_data;
                btn = {btnR, btnL, btnU};
            end
            3'b110: begin
                an = snake_an;
                seg = snake_seg;
                oled_data = combined_oled_data;
                btn = {is_high, is_low, btnU};
            end
            3'b111: begin
                an = snake_an;
                seg = snake_seg;
                oled_data = combined_oled_data;
                btn = {is_high, is_low, btnU};
            end
        endcase
    end

    assign led_out = sw[15] ? lpf_led_out : normal_led_out;
endmodule