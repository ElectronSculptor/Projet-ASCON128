// Gevorg ISHKHANYAN
// Test Bench pour ascon_sbox.sv , pour le projet ASCON
// Mercredi 20 Mars 2024


`timescale 1ns / 1ps

import ascon_pack::*;

module ascon_sbox_tb ();

logic[4:0] sbox_i_s,sbox_o_s;

ascon_sbox DUT (
	.sbox_i(sbox_i_s),
	.sbox_o(sbox_o_s)
);


initial begin
		integer i;
		for( i = 0; i < 32 ; i++) begin
			sbox_i_s = i;
		    #50;
		end
	end

endmodule : ascon_sbox_tb
