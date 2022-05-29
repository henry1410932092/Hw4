`timescale 1ns/1ps
module BCD_tb;
reg clk;
reg rst_asyn;
wire [3:0] Q_out;
parameter PERIOD = 20;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0;
BCD BCD_tb(.clk(clk),.rst_asyn(rst_asyn),.Q_out(Q_out));

initial begin
  #OFFSET;
  forever
  begin
    clk = 1'b0;
    #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
    #(PERIOD*DUTY_CYCLE);
  end
end
  
initial begin
  rst_asyn=0;
  #50 rst_asyn=1'b1;
  #5 rst_asyn=1'b0;  
  #250 $finish;
end
  
initial begin
  $dumpfile("BCD.vcd");
  $dumpvars(0, BCD_tb);
end
endmodule
