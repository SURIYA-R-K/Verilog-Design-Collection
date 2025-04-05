// behavioral  modeling:
`timescale 1ns / 1ps
module and_gate(out,a,b);
input a,b;
output reg out;
always@(*)
begin
out = a&b;
end
endmodule

//dataflow Modeling:
`timescale 1ns / 1ps
module and_gate(out, a, b);
  input a, b;
  output out;

  assign out = a & b;
endmodule

//Structural modeling:
`timescale 1ns / 1ps
module and_gate(out,a,b);
input a,b;
output out;
and(out,a,b);
endmodule

//Test bench or Test harness of and gate:

`timescale 1ns / 1ps
module and_gate_tb;
reg a1,b1;
wire out1;
and_gate dut(.a(a1),.b(b1),.out(out1));
initial
begin
  $dumpfile("and_gate.vcd"); // If you are using GTKWave You can use this dumpfile and dumpvarse
$dumpvars(0,and_gate_tb);
$monitor($time,"a1=%b,b1=%b,out1=%b",a1,b1,out1);
a1=0;b1=0;
#5 a1=0;b1=1;
#5 a1=1;b1=0;
#5 a1=1;b1=1;
#5 $finish;
end
endmodule
