module tcam_TB3;

reg             clk = 1, rstN = 0;
reg             we = 0;
reg             [3:0] waddr;
reg             [15:0] data;
reg             search = 0;
wire    [3:0]   saddr;
wire    [15:0]  sdata;
wire            found;

tcam #(16, 16) TCAM4(clk, rstN, we, waddr, data, search, saddr, sdata, found);

always #5 clk = ~clk;

initial
    begin

    #25 rstN = 1;
	#10 we = 1;

    waddr = 0;
    data = 16'b00x0101010000011;
    
    #10;

    waddr = 5;
    data = 16'b00x01x1110xxxx00;

    #10;

    waddr = 9;
	data = 16'b00x010x010010010;

    #10;

    waddr = 6;
	data = 16'b11x010x010000x0x;

    #10;
    
    waddr = 2;
	data = 16'b0000000010000x0x;

    #10;

    waddr = 1;
	data = 16'b1111110010000000;

    #10;
    $display(" 0:%b\n 1:%b\n 2:%b\n 3:%b\n 4:%b\n 5:%b\n 6:%b\n 7:%b\n 8:%b\n 9:%b\n",
        TCAM4.mem[0],
        TCAM4.mem[1],
        TCAM4.mem[2],
        TCAM4.mem[3],
        TCAM4.mem[4],
        TCAM4.mem[5],
        TCAM4.mem[6],
        TCAM4.mem[7],
        TCAM4.mem[8],
        TCAM4.mem[9],
        TCAM4.mem[10],
        TCAM4.mem[11],
        TCAM4.mem[12],
        TCAM4.mem[13],
        TCAM4.mem[14],
        TCAM4.mem[15]
        );


    #10 we = 0;

    data = 16'b1111110010000000;
    search = 1;

    #10;

    $display("finding %b: found? %d, mem[%d] = %b", data, found, saddr, sdata);

    data = 16'b1100101010xx0101;

    #10;

    $display("finding %b: found? %d, mem[%d] = %b", data, found, saddr, sdata);

    data = 16'b10x0101010000011;

    #10;

    $display("finding %b: found? %d, mem[%d] = %b", data, found, saddr, sdata);

    data = 16'b0x10xx1110101000;

    #10;

    $display("finding %b: found? %d, mem[%d] = %b", data, found, saddr, sdata);

    #10;
    $stop;
    end
endmodule


