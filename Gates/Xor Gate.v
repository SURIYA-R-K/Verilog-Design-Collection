//Xor gate behavioral modelling:

`timescale 1ns / 1ps
module xor_gate(out,a,b);
input a,b;
output reg out;
always@(*)
begin
out = a^b;
end
endmodule

//Xor gate dataflow modelling:

`timescale 1ns / 1ps
module xor_gate(out,a,b);
input a,b;
output out;
assign out = a^b;
endmodule

//Xor gate structural modelling:

`timescale 1ns / 1ps
module xor_gate(out,a,b);
input a,b;
output out;
xor(out,a,b);
endmodule

//Xor gate test bench/test harness:

`timescale 1ns / 1ps
module xor_gate_tb;
reg a1,b1;
wire out1;
xor_gate dut(.a(a1),.b(b1),.out(out1));
initial
begin
$dumpfile("xor_gate.vcd");
$dumpvars(0,xor_gate_tb);
$monitor($time,"a1=%b,b1=%b,out1=%b",a1,b1,out1);
a1=0;b1=0;
#5 a1=0;b1=1;
#5 a1=1;b1=0;
#5 a1=1;b1=1;
#5 $finish;
end
endmodule
