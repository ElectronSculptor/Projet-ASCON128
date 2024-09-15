// Filename        : permutation_step_1_tb.sv
// Author          : Gevorg ISHKHANYAN
// Created On      : 10/05/2023

`timescale 1 ns/ 1 ps

import ascon_pack ::*;

module permutation_step_1_tb();

   type_state state_i_s;
   type_state state_o_s;

   logic       resetb_s;
   logic       clock_s =1'b0;
   logic       sel_i_s;
   logic       en_i_s;

   logic [3:0] round_s;


  
   
   
   permutation_step_1 DUT (
				.clock_i(clock_s),
				.resetb_i(resetb_s),
				.sel_i(sel_i_s),
				.en_i(en_i_s),
               .state_i(state_i_s),
               .state_o(state_o_s),
				.round_i(round_s));
   
   always  begin
       #10;
       assign  clock_s = ~clock_s;
      
   end
   
   initial begin

      state_i_s[0] = 64'h80400c0600000000; 
      state_i_s[1] = 64'h8a55114d1cb6a9a2; 
      state_i_s[2] = 64'hbe263d4d7aecaaff; 
      state_i_s[3] = 64'h4ed0ec0b98c529b7; 
      state_i_s[4] = 64'hc8cddf37bcd0284a;
      	
      resetb_s   = 1'b0;
      sel_i_s = 1'b0;


      en_i_s     = 1'b1;
      round_s    = 4'b0000;
      #2;
      resetb_s   = 1'b1;
      #18;
      sel_i_s = 1'b1;
      round_s = 4'b0001;
      #20;
      round_s = 4'b0010;
      
      #20;
      round_s = 4'b0011;
      
      #20;
      round_s = 4'b0100;
      
      #20;
      round_s = 4'b0101;
      
      #20;
      round_s = 4'b0110;
      
      #20;
      round_s = 4'b0111;
      
      #20;
      round_s = 4'b1000;
      
      #20;
      round_s = 4'b1001;
      
      #20;
      round_s = 4'b1010;
      
      #20;
      round_s = 4'b1011;
      #20;
   end
endmodule: permutation_step_1_tb


