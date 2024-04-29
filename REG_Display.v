`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UT Austin
// Engineer: Brandon King
// 
// Create Date: 04/28/2024 12:30:52 PM
// Design Name: MIPS
// Module Name: REG_Display
// Project Name: LAB 7
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Intended to display parts of REG $2
// 
//////////////////////////////////////////////////////////////////////////////////
module REG_Display(
    input SYS_CLK,
    input [7:0] inVal,
    output reg [3:0] Actv_Sel,
    output reg [6:0] Dspl_Out);
    
// Display Refresh Logic
reg Dspl_Sel;
wire Dspl_Clk;
Divider_30kHz Sel_Clk(SYS_CLK, Dspl_Clk);
    
    
// Simulation Init Block
initial begin
    Actv_Sel = 0;
    Dspl_Sel = 0;
    Dspl_Out = 0;
end


// Set Active 7-Seg
// Allocate BCD16 Into the respective 7-Seg
reg [3:0] HEX;

always@(posedge Dspl_Clk) begin
    Dspl_Sel <= Dspl_Sel + 1;
end

// 4-bit BCD -> Displayed value
// 7-Segment Display Patterns 
always@(posedge SYS_CLK)
begin
    case(Dspl_Sel)
        'b0: begin
            Actv_Sel <= 4'b1101;
            HEX <= inVal[7:4];
        end            
        'b1: begin
            Actv_Sel <= 4'b1110;
            HEX <= inVal[3:0];
        end          
    endcase
    case(HEX)
        4'b0000: Dspl_Out <= 7'b0000001; // "0"     
        4'b0001: Dspl_Out <= 7'b1001111; // "1" 
        4'b0010: Dspl_Out <= 7'b0010010; // "2" 
        4'b0011: Dspl_Out <= 7'b0000110; // "3" 
        4'b0100: Dspl_Out <= 7'b1001100; // "4" 
        4'b0101: Dspl_Out <= 7'b0100100; // "5" 
        4'b0110: Dspl_Out <= 7'b0100000; // "6" 
        4'b0111: Dspl_Out <= 7'b0001111; // "7" 
        4'b1000: Dspl_Out <= 7'b0000000; // "8"     
        4'b1001: Dspl_Out <= 7'b0000100; // "9"
        4'b1010: Dspl_Out <= 7'b0001000; // "A"
        4'b1011: Dspl_Out <= 7'b1100000; // "b"
        4'b1100: Dspl_Out <= 7'b0110001; // "C"
        4'b1101: Dspl_Out <= 7'b1000010; // "d"
        4'b1110: Dspl_Out <= 7'b0110000; // "E"
        4'b1111: Dspl_Out <= 7'b0111000; // "F"
    endcase
end    
  
endmodule
