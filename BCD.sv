module BCD(clk, rst_asyn, Q_out);
input clk;
input rst_asyn;
output [3:0] Q_out;
reg [3:0] Q_out=0;
  
always@ (posedge clk or posedge rst_asyn)
begin
  if (rst_asyn)
 	Q_out=0;
  else if (Q_out == 9)
	Q_out=0;
  else
	Q_out++;
end
endmodule
© 2022 GitHub, Inc.
Terms
