module srgate_tb;


logic ss;
logic rr;
logic q, q_bar;
logic [1:0]conds;

logic[1:0] inputs[] = {
  2'b00,  //Initial
  2'b10,  //Set
  2'b00,  //Latch
  2'b01,  //Set
  2'b00,  //Latch
  2'b11,  //Illegal
  2'b00,  //Latch
};

logic[1:0] expected_output[] = {
  2'bxx,  //Initial
  2'b10,  //Set
  2'b10,  //Latch
  2'b01,  //Set
  2'b01,  //Latch
  2'bzz,  //Illegal
  2'bzz,  //Latch
};

srgate u1(q,q_bar,ss,rr);

assign {ss,rr} = conds;

initial
begin	
	conds = 2'b00;
        #(10ps);
	assert({q,q_bar} === 2'bxx)
	   $display("OK");
        else
           $error("Huh?");

        // Set
	conds = 2'b10;
        #(10ps);
	assert({q,q_bar} === 2'b10)
	   $display("OK");
        else
           $error("Huh?");

        // Latch a 1
	conds = 2'b00;
        #(10ps);
	assert({q,q_bar} === 2'b10)
	   $display("OK");
        else
           $error("Huh? Expected 10 and got %b",{q,q_bar} );
	
	
end







endmodule