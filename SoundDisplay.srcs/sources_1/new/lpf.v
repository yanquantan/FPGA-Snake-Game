`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2020 16:12:39
// Design Name: 
// Module Name: lpf
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


module lpf(
    input clk_20kHz,
    input [11:0] mic_in,
    output reg [11:0] mic_out
    );
    
    reg [11:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31, a32, a33, a34, a35, a36, a37, a38, a39, a40, a41, a42, a43, a44, a45, a46, a47, a48, a49, a50, a51, a52, a53, a54, a55, a56, a57, a58, a59, a60, a61, a62, a63;
    
    reg [31:0] b0 = 10076031;
    reg [31:0] b1 = 10363945;
    reg [31:0] b2 = 11224804;
    reg [31:0] b3 = 12650055;
    reg [31:0] b4 = 14625535;
    reg [31:0] b5 = 17131612;
    reg [31:0] b6 = 20143381;
    reg [31:0] b7 = 23630910;
    reg [31:0] b8 = 27559540;
    reg [31:0] b9 = 31890227;
    reg [31:0] b10 = 36579931;
    reg [31:0] b11 = 41582046;
    reg [31:0] b12 = 46846857;
    reg [31:0] b13 = 52322040;
    reg [31:0] b14 = 57953183;
    reg [31:0] b15 = 63684318;
    reg [31:0] b16 = 69458488;
    reg [31:0] b17 = 75218306;
    reg [31:0] b18 = 80906529;
    reg [31:0] b19 = 86466623;
    reg [31:0] b20 = 91843330;
    reg [31:0] b21 = 96983214;
    reg [31:0] b22 = 101835190;
    reg [31:0] b23 = 106351038;
    reg [31:0] b24 = 110485877;
    reg [31:0] b25 = 114198612;
    reg [31:0] b26 = 117452344;
    reg [31:0] b27 = 120214736;
    reg [31:0] b28 = 122458333;
    reg [31:0] b29 = 124160837;
    reg [31:0] b30 = 125305328;
    reg [31:0] b31 = 125880432;
    reg [31:0] b32 = 125880432;
    reg [31:0] b33 = 125305328;
    reg [31:0] b34 = 124160837;
    reg [31:0] b35 = 122458333;
    reg [31:0] b36 = 120214736;
    reg [31:0] b37 = 117452344;
    reg [31:0] b38 = 114198612;
    reg [31:0] b39 = 110485877;
    reg [31:0] b40 = 106351038;
    reg [31:0] b41 = 101835190;
    reg [31:0] b42 = 96983214;
    reg [31:0] b43 = 91843330;
    reg [31:0] b44 = 86466623;
    reg [31:0] b45 = 80906529;
    reg [31:0] b46 = 75218306;
    reg [31:0] b47 = 69458488;
    reg [31:0] b48 = 63684318;
    reg [31:0] b49 = 57953183;
    reg [31:0] b50 = 52322040;
    reg [31:0] b51 = 46846857;
    reg [31:0] b52 = 41582046;
    reg [31:0] b53 = 36579931;
    reg [31:0] b54 = 31890227;
    reg [31:0] b55 = 27559540;
    reg [31:0] b56 = 23630910;
    reg [31:0] b57 = 20143381;
    reg [31:0] b58 = 17131612;
    reg [31:0] b59 = 14625535;
    reg [31:0] b60 = 12650055;
    reg [31:0] b61 = 11224804;
    reg [31:0] b62 = 10363945;
    reg [31:0] b63 = 10076031;
    
    reg [43:0] sum;
    
    always @ (posedge clk_20kHz) begin
        a0 <= mic_in;
        a1 <= a0;
        a2 <= a1;
        a3 <= a2;
        a4 <= a3;
        a5 <= a4;
        a6 <= a5;
        a7 <= a6;
        a8 <= a7;
        a9 <= a8;
        a10 <= a9;
        a11 <= a10;
        a12 <= a11;
        a13 <= a12;
        a14 <= a13;
        a15 <= a14;
        a16 <= a15;
        a17 <= a16;
        a18 <= a17;
        a19 <= a18;
        a20 <= a19;
        a21 <= a20;
        a22 <= a21;
        a23 <= a22;
        a24 <= a23;
        a25 <= a24;
        a26 <= a25;
        a27 <= a26;
        a28 <= a27;
        a29 <= a28;
        a30 <= a29;
        a31 <= a30;
        a32 <= a31;
        a33 <= a32;
        a34 <= a33;
        a35 <= a34;
        a36 <= a35;
        a37 <= a36;
        a38 <= a37;
        a39 <= a38;
        a40 <= a39;
        a41 <= a40;
        a42 <= a41;
        a43 <= a42;
        a44 <= a43;
        a45 <= a44;
        a46 <= a45;
        a47 <= a46;
        a48 <= a47;
        a49 <= a48;
        a50 <= a49;
        a51 <= a50;
        a52 <= a51;
        a53 <= a52;
        a54 <= a53;
        a55 <= a54;
        a56 <= a55;
        a57 <= a56;
        a58 <= a57;
        a59 <= a58;
        a60 <= a59;
        a61 <= a60;
        a62 <= a61;
        a63 <= a62;
        
        sum = a0 * b0 + a1 * b1 + a2 * b2 + a3 * b3 + a4 * b4 + a5 * b5 + a6 * b6 + a7 * b7 + a8 * b8 + a9 * b9 + a10 * b10 + a11 * b11 + a12 * b12 + a13 * b13 + a14 * b14 + a15 * b15 + a16 * b16 + a17 * b17 + a18 * b18 + a19 * b19 + a20 * b20 + a21 * b21 + a22 * b22 + a23 * b23 + a24 * b24 + a25 * b25 + a26 * b26 + a27 * b27 + a28 * b28 + a29 * b29 + a30 * b30 + a31 * b31 + a32 * b32 + a33 * b33 + a34 * b34 + a35 * b35 + a36 * b36 + a37 * b37 + a38 * b38 + a39 * b39 + a40 * b40 + a41 * b41 + a42 * b42 + a43 * b43 + a44 * b44 + a45 * b45 + a46 * b46 + a47 * b47 + a48 * b48 + a49 * b49 + a50 * b50 + a51 * b51 + a52 * b52 + a53 * b53 + a54 * b54 + a55 * b55 + a56 * b56 + a57 * b57 + a58 * b58 + a59 * b59 + a60 * b60 + a61 * b61 + a62 * b62 + a63 * b63;
        
        mic_out = (((sum[43:32] - 2047) * 2 + 2047) > 4095) ? 4095 : ((sum[43:32] - 2047) * 2 + 2047);
    end
endmodule
