// Filename        : permutation_tb.sv
// Author          : Jean-Baptiste RIGAUD
// Created On      : 14/10/2023
// Last Modified By: ISHKHANYAN Gevorg
// Last Modified On: 05/05/2024
// Update Count    : 3

`timescale 1 ns/ 1 ps

import ascon_pack ::*;

module permutation_tb();

   type_state state_i_s;
   type_state state_o_s;

   logic       resetb_s;
   logic       clock_s =1'b0;
   logic       sel_s;
   logic       en_i_s;
   logic       en_xor_key_s;
   logic       en_xor_key_final_s;
   logic       en_xor_lsb_s;
   logic       en_xor_data_s;

   logic [127:0] key_s;
   logic [63:0]  data_s;
   logic [3:0] round_s;  
   logic [63:0] cipher_o_s;
   logic [127:0] tag_s;

   logic en_out_tag_i;
   logic en_out_cipher_i;


  
   
   
   permutation DUT (
					.clock_i(clock_s),
					.resetb_i(resetb_s),
					.sel_i(sel_s),
					.en_i(en_i_s),
               .state_i(state_i_s),
               .state_o(state_o_s),
               .cipher_o(cipher_o_s),
               .tag_o(tag_s),

					.en_xor_key_i(en_xor_key_s),
					.en_xor_lsb_i(en_xor_lsb_s),
					.en_xor_data_i(en_xor_data_s),
					.en_xor_key_final_i(en_xor_key_final_s),
					.key_i(key_s),
					.data_i(data_s),
					.round_i(round_s),

               .en_out_cipher_i(en_out_cipher_i),
               .en_out_tag_i(en_out_tag_i)
					);
   
   always  begin
       #10;
       assign  clock_s = ~clock_s;
      
   end
   
   initial begin
      int i;
      data_s =1'b0;
      key_s	 = 128'h8a55114d1cb6a9a2be263d4d7aecaaff;
      
      en_out_cipher_i = 1'b0;
      en_out_tag_i = 1'b0;

      state_i_s[0] = 64'h80400c0600000000; 
      state_i_s[1] = 64'h8a55114d1cb6a9a2; 
      state_i_s[2] = 64'hbe263d4d7aecaaff; 
      state_i_s[3] = 64'h4ed0ec0b98c529b7; 
      state_i_s[4] = 64'hc8cddf37bcd0284a;
      	
      resetb_s   = 1'b0;
      sel_s = 1'b0;

      // On désactive tous les XOR 
      en_xor_data_s      = 1'b0;
      en_xor_key_s  = 1'b0;
      en_xor_lsb_s       = 1'b0;
      en_xor_key_final_s = 1'b0;


      en_i_s     = 1'b1;
      round_s    = 4'b0000;
      #2;
      resetb_s   = 1'b1;
      #18;
      sel_s = 1'b1;
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
endmodule: permutation_tb


