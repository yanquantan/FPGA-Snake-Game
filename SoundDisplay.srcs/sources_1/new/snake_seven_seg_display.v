`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2020 21:00:59
// Design Name: 
// Module Name: seven_seg_display
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


module snake_seven_seg_display(
    input CLOCK,
    input [4:0] len,
    output [3:0] an,
    output [7:0] seg
    );
    
    reg SIGNAL = 0;
    reg [3:0] anode;
    reg [7:0] cath;
    wire [7:0] cath_1, cath_2;
    snake_output_decimal D(len, cath_1, cath_2);
 
    always @ (posedge CLOCK) begin
        case (SIGNAL)
            0:
                begin
                    anode <= 4'b0001;
                    cath <= cath_1;
                    SIGNAL <= SIGNAL + 1;
                end
            1:
                begin
                    anode <= 4'b0010;
                    cath <= cath_2;
                    SIGNAL <= SIGNAL + 1;
                end
        endcase
    end
    
    assign seg = cath;
    assign an = ~anode;
    
endmodule
