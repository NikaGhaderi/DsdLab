module TB;
 reg [7:0] a;
 reg [7:0] b;
 reg cin;
 wire [7:0] s;
 wire cout;

 adder ebaIns(a, b, cin, s, cout);

 initial begin
    cin = 8'd0;
    a = 8'd0;
    b = 8'd0;
    #100 a = 8'd5; b = 8'd6;
    #100 b = 8'd3;
    #100 a = 8'd9;
    #100 b = 8'd9;
    #100 a = 8'd0; b = 8'd0;
    #100 a = 8'd255; b = 8'd0; cin = 8'd1;
    #100 $stop;
 end

 initial
    $monitor($time, ") a: %b\t b: %b\t sum: %b\t carry: %b", a, b, s, cout);

 initial begin
    $display("Here is the result of our counter");
    $display("---------------------------------");
 end

endmodule


