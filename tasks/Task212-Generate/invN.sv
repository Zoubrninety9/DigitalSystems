// Example of generate for to replicate hardware
module invN #(parameter N=2) (output logic[N-1:0] Y, input logic[N-1:0] X);

//An integer that will never be represented in the final synthesis
genvar i;

generate 
 for (i=0; i<N; i=i+1) 
 begin : i_loop1
 if (i == 0 | i ==2)
	assign Y[i] = ~X[i];
	else
	assign Y[i] = X[i];
	
 end
endgenerate

endmodule



