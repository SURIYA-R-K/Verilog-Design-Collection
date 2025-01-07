//code for OR GATE:

module Or_gate(in1,in2,out);
input in1;
input in2;
output out;
assign out = in1|in2;
endmodule

// Test bench code for OR Gate :

module OR_gate_tb;
reg in1,in2;
wire out1;
Or_gate(.in1(in1),.in2(in2),.out(out1));
initial
begin
$monitor($time,"in1=%b,in2=%b,out1=%b",in1,in2,out1);
#5 in1 = 0 ; in2 = 0;
#5 in2 = 1 ;
#5 in1 = 1 ; in2 = 0;
#5 in2 = 1 ;
#5 $finish;
end
endmodule
