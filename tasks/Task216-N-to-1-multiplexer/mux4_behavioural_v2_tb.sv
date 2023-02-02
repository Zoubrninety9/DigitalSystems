module mux4_behavioural_v2_tb #(parameter N=8);

//Internal signals for testing
logic y2;
logic [N-1:0] x;
logic [$clog2(N)-1:0] ss; //2 bit signal

//Instantiate the component under test
muxN #(.N(8)) u1(y2, x, ss);


initial
begin
	//Unpacked array of expected (correct) outputs. Automatic means this has local scope
	automatic logic expected[N] = {1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1};
        //1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1
	//Set inputs (note the direction)
	x = 8'b10101100;

	//Iterate over all input sequences
	for (int n=0; n<N; n = n + 1) begin
		//Set the select line
		ss = n;

		//Add a delay so that the outputs update
		#10ps;

	        //Check output is the expected value
    	        assert (y2 == expected[n])
                  //Note how $display and $error can be used much like printf in C
                  $display("Passed test %d, output=%d, expected=%d", n, y2, expected[n]);
                else
                   $error("Error for test %d: expected %d and got %d", n, expected[n], y2);		
	end
end

endmodule