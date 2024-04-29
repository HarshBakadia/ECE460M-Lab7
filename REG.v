module REG(CLK, RegW, SW, BTNR, DR, SR1, SR2, Reg_In, R1_Low, ReadReg1, ReadReg2, R2_Disp);
  input CLK;
  input RegW;
  input [2:0] SW;
  input BTNR;
  input [4:0] DR;
  input [4:0] SR1;
  input [4:0] SR2;
  input [31:0] Reg_In;
  output [7:0] R1_Low;
  output reg [31:0] ReadReg1;
  output reg [31:0] ReadReg2;
  output reg [15:0] R2_Disp;

  reg [31:0] REG [0:31];
  integer i;

  initial begin
    ReadReg1 = 0;
    ReadReg2 = 0;
  end

  // Lifting lower 8 bits of R1 out
  wire [31:0] R1_Full;
  assign R1_Full = REG[1];
  assign R1_Low = R1_Full[7:0];
  
  always @(posedge CLK)
  begin

    if(RegW == 1'b1)
      REG[DR] <= Reg_In[31:0];

    ReadReg1 <= REG[SR1];
    ReadReg2 <= REG[SR2];
    ///// PART B MAPPINGS
    REG[1][2:0] <= SW;
    R2_Disp <= (BTNR ? REG[2][31:16] : REG[2][15:0]);
  end
endmodule
