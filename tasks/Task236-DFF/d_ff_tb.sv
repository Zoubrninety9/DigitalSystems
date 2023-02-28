module d_ff_tb;

logic CLK = 0;
logic D, Q;
logic nReset;
//Instantiate a DFF
d_ff1 u1(Q,D,CLK,nReset);

//Generate 5 clock cycles
initial begin
	CLK=0;
     	repeat(20) 
		#50ps CLK = ~CLK;  
end 

//Tests (synchronous - write on falling edge of the clock; read on rising)
initial begin
	//Initialise
	nReset = 0;
	D = 0;

	//Test for when D = 1
	@(negedge CLK);	//Wait for negative edge of clock
	D = 1;		//Set D = 1
	@(posedge CLK);	//Wait for positive edge of clock
	#1 assert(Q == 0) $display("PASS"); else $error("FAIL");	//Check Q

	//Test for when D = 0
	@(negedge CLK);	//Wait for negative edge of clock
	D = 0;		//Set D = 0
	@(posedge CLK);	//Wait for negative edge of clock
	#1 assert(Q == 0) $display("PASS"); else $error("FAIL");	//Check Q

	nReset=0;

	#1 @(negedge CLK);
	D=1;
	@(posedge CLK);
	#1 assert(Q==0) $display("pass"); else $error("fail");
	@(negedge CLK);
	D=0;
	
	nReset =1;

	#1 @(negedge CLK);
	D=1;
	@(posedge CLK);
	#1 assert(Q==D) $display("pass"); else $error("fail");
	
	@(negedge CLK);
	D=0;
	@(posedge CLK);
	#1 assert(Q==D) $display("pass"); else $error("fail");
		
	@(posedge CLK);
	#1 assert(Q == D) $display("passsss"); else $error("huh");
	
end
endmodule