// Gevorg ISHKHANYAN
// Test Bench pour le constant addition pour le projet ASCON
// Création Mercredi 13/03/24


`timescale 1ns/1ps

import ascon_pack::*;


module constant_addition_tb ();


	type_state state_i_s;
	logic[3:0] round_i_s;
	type_state state_o_s;

constant_addition DUT (
	.state_i(state_i_s),
	.round_i(round_i_s),
	.state_o(state_o_s)
);


// Stimuli de test

	initial begin
		state_i_s[0] = 64'h80400c0600000000;
		state_i_s[1] = 64'h8a55114d1cb6a9a2;
		state_i_s[2] = 64'hbe263d4d7aecaaff;
		state_i_s[3] = 64'h4ed0ec0b98c529b7;
		state_i_s[4] = 64'hc8cddf37bcd0284a;

		round_i_s = 4'h0;
		      

		# 50;
		      
		state_i_s[0] = 64'ha71b22fa2d0f5150;
		state_i_s[1] = 64'hb11e0a9a608e0016;
		state_i_s[2] = 64'h076f27ad4d99d5e7;
		state_i_s[3] = 64'ha72ac1ad8440b0b7;
		state_i_s[4] = 64'h0657b0d6eaf9c1c4;
	      
		round_i_s = 4'h1;  
	end // initial begin

endmodule : constant_addition_tb
