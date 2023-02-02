module mux2_structural (output logic y, input logic a, b, s);



wire invs;
wire term0;
wire term1;


and u1 (term0, s, b);
not u2 (invs, s);
and u3 (term1, a, invs);
or u4 (y, term0, term1);


endmodule