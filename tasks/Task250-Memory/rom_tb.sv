module rom_tb #(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=3);

////

logic [(ADDR_WIDTH-1):0]tb_addr;
logic [(DATA_WIDTH-1):0]tb_q;
logic [(DATA_WIDTH-1):0]tb_q2;
logic tb_clk = 0;
logic [DATA_WIDTH-1:0] memarray[2**ADDR_WIDTH-1:0];

single_port_rom_async #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) u1(tb_addr, tb_q);
single_port_rom_async2 #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) u2(tb_addr, tb_q2);


always #(5ps) tb_clk = ~tb_clk;

initial begin 

   $readmemb("single_port_rom_init.txt",memarray);
end



initial begin 
tb_addr <= 0;

repeat(8)begin
 @(negedge(tb_clk));
 tb_addr <= tb_addr +1;
end

end

always @(posedge tb_clk) begin 
   #(10ps);
   assert (tb_q & tb_q2 == memarray[tb_addr]) $display("passed");
	else $error("error at address %0d expected %0b but got %0b and %0b", tb_addr, memarray[tb_addr], tb_q, tb_q2);
 
end


endmodule
 