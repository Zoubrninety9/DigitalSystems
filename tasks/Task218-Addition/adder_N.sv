//module adder_N #(parameter N = 4) (output logic [N-1:0] Sum, logic Cout, input logic [N-1:0] A, B, logic Cin);

module adder_N #(parameter N = 4);

//Use the more 'vertical' syntax to fit on the page
output logic [N-1:0] Sum;
output logic Cout;
input logic [N-1:0] A, B;
input logic Cin;

//output logic [7:4]Sum2; 
//output logic Cout2;
//input logic [7:4] A2, B2;
//input logic Cin2;

always_comb
	{Cout, Sum} = A + B + Cin;
	// Cout = Cin2;
	//{Cout2, Sum2} = A2 + B2 + Cin2;
endmodule