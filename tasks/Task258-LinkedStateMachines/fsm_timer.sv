module fsm_timer #(parameter int unsigned N=512) (output logic READY, input logic CLK, START, RESET, N_RESET);

   typedef enum int unsigned {WAITING_FOR_START_S = 1, COUNTING_S = 2, DONE_COUNTING_MAX_REACHED_S =4} state_t;

   state_t state;
   state_t next_state;
	int count;
   //Next state logic
   always_comb begin : next_state_logic

      //Default - stay put
      next_state = state;

      //Update state - COMPLETE THIS
      case (state)
        WAITING_FOR_START_S: next_state = (START == 1) ? COUNTING_S : WAITING_FOR_START_S;       //First state
        COUNTING_S:   next_state = (count == 1) ? DONE_COUNTING_MAX_REACHED_S : COUNTING_S;       //End state
        DONE_COUNTING_MAX_REACHED_S: next_state = (N_RESET == 1) ? WAITING_FOR_START_S : DONE_COUNTING_MAX_REACHED_S; // last state
      default: next_state = WAITING_FOR_START_S ;       //Intermediate states
      endcase
   end

   //Output logic -  COMPLETE THIS
   always_comb begin : output_logic
      case (state)
      DONE_COUNTING_MAX_REACHED_S: if(N_RESET == 1) 
													READY = 1;
												else
													READY = 0;
					
      default: READY = 0;
      endcase
   end

   //Update state
   always_ff @(posedge CLK or negedge N_RESET) begin : update_state
   if(~N_RESET) 
      state <= WAITING_FOR_START_S;
   else
      state <= next_state;
   end


   always_ff @(posedge CLK or negedge N_RESET) begin : count_update
    if (~N_RESET) 
            count = N;

    else 
        case (state)
         WAITING_FOR_START_S:  count <= N;
                COUNTING_S :  count <= count-1;
                        DONE_COUNTING_MAX_REACHED_S: ;

                    default: count <= N;
        endcase    
   end


endmodule
