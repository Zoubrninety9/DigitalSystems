module d_ff_tb3;

parameter N  = 8;

logic [N-1:0]Q;
logic [N-1:0]q_int;
logic [N-1:0]D;
logic ck, n_reset, enable;
assign #10ps Q = q_int;

//d_ffN #(.N(N)) u1([N-1:0]Q, [N-1:0]D, ck, n_reset, enable);

initial
begin 
		
	n_reset = 0;
	






end

endmodule