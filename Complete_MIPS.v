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

module Complete_MIPS(
  input SYS_CLK,
  input RST,
  input HALT,
  output HB,  
  output [7:0] LED,  
  output [3:0] Actv_Sel,
  output [6:0] Dspl_Out
//  output A_Out,
//  output D_Out
  );
  // Will need to be modified to add functionality
  // THIS IS YOUR TOP MODULE. YOU DEFINE WHAT SIGNALS YOU NEED TO INPUT AND OUTPUT  
  wire CS, WE;
  wire [6:0] ADDR;
  wire [31:0] Mem_Bus;
  wire [7:0] R1_Out;
  wire slw_clk, halt_clk;
  Divider_1Hz Slw_Clk(SYS_CLK, slw_clk);
  assign halt_clk = (slw_clk & !HALT);
  MIPS CPU(.CLK(halt_clk), .RST(RST), .CS(CS), .WE(WE), .ADDR(ADDR),
           .R1_Out(R1_Out), .Mem_Bus(Mem_Bus));
  Memory MEM(CS, WE, SYS_CLK, ADDR, Mem_Bus);
  
  ///////
  reg [7:0] data_in = 0;
  REG_Display REG_Disp(.SYS_CLK(SYS_CLK), .inVal(data_in), .Actv_Sel(Actv_Sel), .Dspl_Out(Dspl_Out));
  assign LED = R1_Out;
  assign HB = halt_clk;

endmodule