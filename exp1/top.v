module adder(input [7:0] a,b, input cin, output [7:0] s, output cout);
 wire c0, c1, c2, c3, c4, c5, c6;

 FullAdder fa0(s[0], c0, a[0], b[0], cin);  // s = 06, c = 05
 FullAdder fa1(s[1], c1, a[1], b[1], c0);   // s = 08, c = 07
 FullAdder fa2(s[2], c2, a[2], b[2], c1);   // s = 10, c = 09
 FullAdder fa3(s[3], c3, a[3], b[3], c2);   // s = 12, c = 11
 FullAdder fa4(s[4], c4, a[4], b[4], c3);   // s = 14, c = 13
 FullAdder fa5(s[5], c5, a[5], b[5], c4);   // s = 16, c = 15
 FullAdder fa6(s[6], c6, a[6], b[6], c5);   // s = 18, c = 17
 FullAdder fa7(s[7], cout , a[7], b[7], c6);   // s = 20, c = 19

endmodule

