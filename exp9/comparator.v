
module comparator #(
    parameter MEM_SIZE = 16,
    parameter MEM_LENGTH = 16 
) (
      a,
      b,
      match
);

    input   [MEM_LENGTH-1:0]  a;
    input   [MEM_LENGTH-1:0]  b;
    output          match;

wire    [MEM_LENGTH-1:0]  matches;

genvar i;
generate
    for(i = 0; i < MEM_LENGTH; i = i + 1) begin
        assign matches[i] = a[i] === 1'bx || b[i] === 1'bx || ~(a[i] ^ b[i]);
    end
endgenerate

assign match = &matches;

endmodule