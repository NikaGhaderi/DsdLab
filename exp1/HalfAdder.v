module HalfAdder(s, c, a, b);
 input a, b;
 output s, c;
 reg s, c;

 always @ (a or b)
    #3 s = a ^ b;
 
  always @ (a or b)
    #2 c = a & b;

endmodule


