//////////////////////////////////////////////////////////////////////////////////
// Company: UT Austin
// Engineer: Harsh Bakadia
// 
// Create Date: 04/24/2024 08:00:07 PM
// Design Name: 
// Module Name: Complete_MIPS
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

module Complete_MIPS(CLK, RST, A_Out, D_Out);
  // Will need to be modified to add functionality
  // THIS IS YOUR TOP MODULE. YOU DEFINE WHAT SIGNALS YOU NEED TO INPUT AND OUTPUT
  input CLK;
  input RST;
  output A_Out;
  output D_Out;

  wire CS, WE;
  wire [6:0] ADDR;
  wire [31:0] Mem_Bus;

  MIPS CPU(CLK, RST, CS, WE, ADDR, Mem_Bus);
  Memory MEM(CS, WE, CLK, ADDR, Mem_Bus);

endmodule