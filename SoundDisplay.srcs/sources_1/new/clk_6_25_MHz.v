`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2020 15:32:22
// Design Name: 
// Module Name: clk_6_25_MHz
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


module clk_6_25_MHz(
    input CLOCK,
    output slow_clk
    );
    
    reg [3:0] COUNTER = 4'b0;
    
    always @ (posedge CLOCK) begin
        COUNTER = COUNTER + 1;
    end
    
    assign slow_clk = COUNTER[3];
    
endmodule
