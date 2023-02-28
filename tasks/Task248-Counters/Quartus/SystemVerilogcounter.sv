module counterN1 #(parameter N=8) (output logic [N-1:0] Y, input logic CLK, input logic N_RESET, input logic DIR);

logic [N-1:0] count;

//Connect output to internal register count
assign Y = count;

always_ff @(posedge CLK)
 begin
	if (N_RESET == 0) 
		count <= 0;
	else if(DIR == 0)
		count <= count + 1;
	else if(DIR == 1)
		count <= count - 1;
	
end

endmodule