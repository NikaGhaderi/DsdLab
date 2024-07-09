module tcam #(
    parameter MEM_SIZE   =  16,
    parameter MEM_LENGTH =  16 
) (
              clk,
              rstN,
              we,
              waddr,
              data,
              search,
              saddr,
              sdata,
              found
);


    input                            clk;
    input                            rstN;
    input                            we;
    input   [$clog2(MEM_SIZE)-1:0]   waddr;
    input   [MEM_LENGTH-1:0]         data;
    input                            search;
    output  [$clog2(MEM_SIZE)-1:0]   saddr;
    output  [MEM_LENGTH-1:0]         sdata;
    output                           found;


    reg     [MEM_LENGTH-1:0]         mem [MEM_SIZE-1:0];
    wire    [MEM_SIZE:0]             matches;
    reg     [$clog2(MEM_SIZE)-1:0]   search_res;
    reg     [$clog2(MEM_SIZE)-1:0]   addrx;
    reg     [MEM_LENGTH-1:0]         datax;

  always @* begin
        addrx = {$clog2(MEM_SIZE){1'bx}};
        datax = {MEM_LENGTH{1'bx}};
    end


assign saddr = search ? search_res : addrx;
assign sdata = search ? mem[search_res] : datax;
assign found = (|matches) & search & (|matches !== 1'bx);

genvar i;
generate
    for (i = 0; i < MEM_SIZE; i = i + 1)
        comparator #(MEM_SIZE, MEM_LENGTH) cmp(mem[i], data, matches[i]);
endgenerate

integer j, z;
always @(posedge clk or negedge rstN) begin
    if (~rstN) begin
        for (j = 0; j < MEM_SIZE; j = j + 1)
            mem[j]  = 0;
        search_res = 0;
    end
    else if (we)
        mem[waddr] = data;
    else begin
        search_res = addrx;
        if (search && found)
            for (z = 0; z < MEM_SIZE; z = z + 1)
                if (search_res === addrx && matches[z]) search_res = z;
    end 
end
    
endmodule