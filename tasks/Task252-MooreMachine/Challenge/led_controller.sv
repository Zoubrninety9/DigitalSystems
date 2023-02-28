// SystemVerilog state machine implementation that uses enumerated types.
// Altera recommends using this coding style to describe state machines in SystemVerilog.
// In Quartus Prime integrated synthesis, the enumerated type
// that defines the states for the state machine must be
// of an unsigned integer type. If you do not specify the
// enumerated type as int unsigned, a signed int type is used by default.
// In this case, the Quartus Prime integrated synthesis synthesizes the design, but
// does not infer or optimize the logic as a state machine.
//


module led_controller (input logic clk, reset, UP_PULSE, DOWN_PULSE, output logic [7:0] Q);

typedef enum int unsigned { S0 = 32'b00000001, S1 = 32'b00000011, 
                            S2 = 32'b00000111, S3 = 32'b00001111, 
                            S4 = 32'b00011111, S5 = 32'b00111111, 
									 S6 = 32'b01111111, S7 = 32'b11111111 }  STATE_t;
STATE_t state, next_state;


initial begin
	state = S0;
end

always_comb begin : next_state_logic

	next_state = state;

	case(state)

    S0:    if (UP_PULSE == '1)
                next_state = state.next();

            else if (DOWN_PULSE == '1)
                next_state = S0;


    S1:    if (UP_PULSE == '1)
                next_state = state.next();

            else if (DOWN_PULSE == '1)
                next_state = state.prev();


    S2:    if (UP_PULSE == '1)
                next_state = state.next();

            else if (DOWN_PULSE == '1)
                next_state = state.prev();



    S3:    if (UP_PULSE == '1)
                next_state = state.next();

            else if (DOWN_PULSE == '1)
                next_state = state.prev();

    S4:    if (UP_PULSE == '1)
                next_state = state.next();

            else if (DOWN_PULSE == '1)
                next_state = state.prev();

    S5:    if (UP_PULSE == '1)
                next_state = state.next();

            else if (DOWN_PULSE == '1)
                next_state = state.prev();

    S6:    if (UP_PULSE == '1)
                next_state = state.next();

            else if (DOWN_PULSE == '1)
                next_state = state.prev();

    S7:    if (UP_PULSE == '1)
                next_state = state;

            else if (DOWN_PULSE == '1)
                next_state = state.prev();
	endcase
    
end
	
always_ff @(posedge clk or negedge reset) begin

	if (reset == '0)
		state <= S0;
	else
		state <= next_state;
end
	
always_comb begin : output_logic

	//Nice and simple!
	Q = state;
	
end

	
endmodule
