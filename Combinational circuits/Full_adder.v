//Full adder behavioral modeling:

`timescale 1ns / 1ps
module full_adder(sum,carry,a,b,cin);
input a,b,cin;
output reg sum,carry;
always@(*)
begin
sum = a^b^cin;
carry = (a&b)|(b&cin)|(cin&a);
end
endmodule

//Full adder dataflow modeling:

`timescale 1ns / 1ps
module full_adder(sum,carry,a,b,cin);
input a,b,cin;
output sum,carry;
assign sum = a^b^cin;
assign carry = (a&b)|(b&cin)|(cin&a);
endmodule

//Full adder structural modeling:

`timescale 1ns / 1ps
module full_adder(sum,carry,a,b,cin);
input a,b,cin;
output sum,carry;
wire [0:2]t;
xor(t[0],a,b);
xor(sum,t[0],cin);
and(t[1],a,b);
and(t[2],t[0],cin);
or(carry,t[1],t[2]);
endmodule

//Full adder test bench/ test harness:

`timescale 1ns / 1ps
module full_adder_tb;
reg a1,b1,cin1;
wire sum1,carry1;
full_adder dut(.a(a1),.b(b1),.cin(cin1),.sum(sum1),.carry(carry1));
initial
begin
$dumpfile("full_adder.vcd");
$dumpvars(0,full_adder_tb);
$monitor($time,"a1=%b,b1=%b,cin1=%b,sum1=%b,carry1=%b",a1,b1,cin1,sum1,carry1);
a1=0;b1=0;cin1=0;
#5 a1=0;b1=0;cin1=1; 
#5 a1=0;b1=1;cin1=0;
#5 a1=0;b1=1;cin1=1;
#5 a1=1;b1=0;cin1=0;
#5 a1=1;b1=0;cin1=1;
#5 a1=1;b1=1;cin1=0;
#5 a1=1;b1=1;cin1=1;
#5 $finish;
end
endmodule
