//behavioral modeling of 2x1 mux:

`timescale 1ns / 1ps
module mux_2x1(out,sel,y0,y1);
input y0,y1,sel;
output reg out;
always@(*)
begin
out = (y0&(~sel))|(y1&sel);
end
endmodule

//dataflow modeling of 2x1 mux:

`timescale 1ns / 1ps
module mux_2x1(out,sel,y0,y1);
input y0,y1,sel;
output out;
assign out = (y0&(~sel))|(y1&sel);
endmodule

//structural modeling of 2x1 mux:

`timescale 1ns / 1ps
module mux_2x1(out,sel,y0,y1);
input y0,y1,sel;
output out;
wire not_sel,and0,and1;
not(not_sel,sel);
and(and0,y0,not_sel);
and(and1,y1,sel);
or(out,and0,and1);
endmodule

//2x1 mux Testbench / test harness:


module mux_2x1_tb;
reg y0,y1;
reg sel;
wire out;
mux_2x1 dut(.y0(y0),.y1(y1),.sel(sel),.out(out));
initial
begin
$monitor($time,"y0=%b,y1=%b,sel=%b,out=%b",y0,y1,sel,out);
   y0 = 0; y1 = 0; sel = 0;
#5 y0 = 0; y1 = 0; sel = 1;
#5 y0 = 0; y1 = 1; sel = 0;
#5 y0 = 0; y1 = 1; sel = 1;
#5 y0 = 1; y1 = 0; sel = 0;
#5 y0 = 1; y1 = 0; sel = 1;
#5 y0 = 1; y1 = 1; sel = 0;
#5 y0 = 1; y1 = 1; sel = 1;
#5 $finish;
end
endmodule
