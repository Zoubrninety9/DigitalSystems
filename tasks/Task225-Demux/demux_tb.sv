module demux_tb;


	logic aa;
	logic [2:0]sel;
	logic [7:0]y;
	logic [3:0]mt;

	assign{aa,sel} = mt;
	demux u1 (y,aa,sel);
	//tryy12
	initial 

		begin
		
		mt = 0;
		#50ps assert (y << 0) $display("passed %b",mt); else $error("Failed for %b",mt);
		mt = 8;
		#50ps assert (y << 1) $display("passed %b", mt); else $error("Failed for %b", mt);
		mt = 9;
		#50ps assert (y << 2) $display("passed %b", mt); else $error("Failed for %b", mt);
		mt = 10;
		#50ps assert (y << 3) $display("passed %b", mt); else $error("Failed for %b", mt);
		mt = 11;
		#50ps assert (y << 4) $display("passed %b", mt); else $error("Failed for %b", mt);
		mt = 12;
		#50ps assert (y << 5) $display("passed %b", mt); else $error("Failed for %b", mt);
		mt = 13;
		#50ps assert (y << 6) $display("passed %b", mt); else $error("Failed for %b", mt);
		mt = 14;
		#50ps assert (y << 7) $display("passed %b", mt); else $error("Failed for %b", mt);
		mt = 15;
		#50ps assert (y << 8) $display("passed %b", mt); else $error("Failed for %b", mt);






		end

endmodule