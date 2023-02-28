module srgat2_tb;


logic ss;
logic rr;
logic r_n;
logic qq;
logic qqB;
logic [1:0]mt;

srgate u2 (qq,qqB,ss,rr,r_n);

assign {ss,rr} = mt;

initial 
	
	begin
	
	r_n= 1'b0;
	#100
	assert(qq === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);

	mt= 2'b01;
	#100
	assert(qq === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);

	mt= 2'b10;
	#100
	assert(qq === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);

	mt= 2'b00;
	#100
	assert(qq === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);

	r_n= 1'b1;
	#100
	assert(qq === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);

	mt= 2'b00;
	#100
	assert(qq === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);

	//S =1
	mt = 2'b10;
	#100
	assert(qq === 1'b1) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);

	//S =0,R = 0
	mt = 2'b00;
	#100
	assert(qq === 1'b1) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);

	//S =0, R =1
	mt = 2'b01;
	#100
	assert(qq === 1'b0) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'b1) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);

	//S =1, R =1
	mt = 2'b11;
	#100
	assert(qq === 1'bz) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	assert(qqB === 1'bz) $display("passed for mt = %d", mt); else $error("Failed for mt = %d", mt);
	
	end
	
	always@(ss,rr)
	begin
	$display("{S,R}= {%b,%b}", ss,rr);
	end

	always @(qq)
	begin
	$display("Q => %b",qq);
	end

	
endmodule 