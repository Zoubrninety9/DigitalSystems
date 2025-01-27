
module fsm_moore (input logic CLK, N_RESET, X, READY, output logic RESET, START, Y);

typedef enum int unsigned { IDLE = 1, ST = 2, HD = 4, DT=8 } state_t;
state_t state, next_state;

always_comb begin : next_state_logic

   //Default is to stay in the current state
   next_state = state;

   //COMPLETE THIS
   case(state)

   IDLE: next_state = (X == 1) ? ST : IDLE; 

   ST: next_state = HD;

   HD:   if({X,READY} == 2'b11 )
            next_state = DT;
         else if ({X,READY} == 2'b10)
            next_state = HD;
         else
            next_state = IDLE;
				
   DT:  next_state = DT;
            
   default:
         next_state = IDLE; 
        

   endcase
end

always_ff @(posedge CLK or negedge N_RESET) begin

   if (N_RESET == '0)
      state <= IDLE;
   else
      state <= next_state;
end

always_comb begin : output_logic
   //COMPLETE THIS
   case(state)
   IDLE: {START,RESET,Y} = 3'b010;
   ST:   {START,RESET,Y} = 3'b100;
   HD:   {START,RESET,Y} = 3'b0;
   DT:   {START,RESET,Y} = 3'b001;   
   default: {START,RESET,Y} = 3'b0;
   endcase
end

endmodule
