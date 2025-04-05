//Nor gate behavioral modeling:

`timescale 1ns / 1ps
module nor_gate(out,a,b);
input a,b;
output reg out;
always@(*)
begin
out = ~(a|b);
end
endmodule

//Nor gate dataflow modeling:

`timescale 1ns / 1ps
module nor_gate(out,a,b);
input a,b;
output out;
assign out = ~(a|b);
endmodule

//Nor gate structural modeling:

`timescale 1ns / 1ps
module nor_gate(out,a,b);
input a,b;
output out;
nor(out,a,b);
endmodule

//Nor gate testbench/test harness:

`timescale 1ns / 1ps
module nor_gate_tb;
reg a1,b1;
wire out1;
nor_gate dut(.a(a1),.b(b1),.out(out1));
initial
begin
$dumpfile("nor_gate.vcd");
$dumpvars(0,nor_gate_tb);
$monitor($time,"a1=%b,b1=%b,out1=%b",a1,b1,out1);
a1=0;b1=0;
#5 a1=0;b1=1;
#5 a1=1;b1=0;
#5 a1=1;b1=1;
#5 $finish;
end
endmodule
