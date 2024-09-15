// Gevorg ISHKHANYAN
// Projet ASCON : Fonction S box , avec des entrées de 5 bits. Il y aura 64 entrées dans ce projet
// Mercredi 20 Mars 2024


import ascon_pack::*;

module ascon_sbox(
	input logic[4:0] sbox_i,
	output logic[4:0] sbox_o 
);

// Substitution sur 5 bits

	assign sbox_o = sbox_t[sbox_i];
endmodule : ascon_sbox
