module FullAdder(s, cout, a, b, cin);
 input a, b, cin;
 output cout, s;
 wire s0, c0, c1;

 HalfAdder ha0(s0, c0, a, b);
 HalfAdder ha1(s, c1, cin, s0);
 
 assign cout = c0 | c1;
endmodule


