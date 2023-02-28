module regN2 #(parameter N = 8)(
   output logic [N-1:0]q,
   input  logic [N-1:0]d,
   input  logic oe,
   input  logic load,
   input  logic reset,
   input  logic clk
);

always_ff @(posedge clk or negedge reset) begin
if (reset == 0) begin
    q <= 0;
end else if (oe == 1)begin
    q <= d;
end
    
end

endmodule