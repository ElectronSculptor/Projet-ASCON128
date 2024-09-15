// GEVORG ISHKHANYAN
// Lundi 15 Avril 2024
// Permutation complète avec les XOR et les Registres

import ascon_pack::* ;

`timescale 1ns / 1ps

module permutation (
	input logic sel_i,
    input logic clock_i,
    input logic resetb_i,


    input logic en_i,
    input logic[3:0] round_i,
    input type_state state_i,
	output type_state state_o,

    // Pour les deux Xor
    input logic en_xor_data_i, //active xor donnée associée ou plaintext
    input logic en_xor_key_final_i, //active xor avec cle pour la finalisation
    input logic en_xor_key_i, //active xor avec cle pour la finalisation
    input logic en_xor_lsb_i, //active xor avec LSB en fin de DA
    input logic [127 : 0] key_i,  // Valeur de la clé à xorer
    input logic [63 : 0] data_i,


    // Pour le premier registre (cipher)
    input logic en_out_cipher_i,
    output logic cipher_o,

    // Pour le dernier registre (tag)
    output logic tag_o,
    input logic en_out_tag_i
    
);

// Internal net declaration
type_state mux_to_xor_begin_s, xor_begin_to_add_s,
 const_to_sub_s, sub_to_lin_s, lin_to_xor_end_s, xor_end_to_reg_s;






mux_state Multiplexeur (
	.sel_i(sel_i),
	.data1_i(state_i),
	.data2_i(state_o),
	.data_o(mux_to_xor_begin_s)
);



xor_begin_perm Xor_begin (
    .en_xor_data_i(en_xor_data_i),
    .en_xor_key_i(en_xor_key_i),
    .key_i(key_i),
    .data_i(data_i),
    .state_i(mux_to_xor_begin_s),
    .state_o(xor_begin_to_add_s)  
);





register_w_en #(
    .nb_bits_g(64)
)
register_cipher 
(
	.clock_i(clock_i),
	.resetb_i(resetb_i),
	.en_i(en_out_cipher_i),
    .data_i(xor_begin_to_add_s[0]),
	.data_o(cipher_o)
);




constant_addition Pc (
	.state_i(xor_begin_to_add_s),
	.round_i(round_i),
	.state_o(const_to_sub_s)
);
substitution_layer Ps (
	.state_i(const_to_sub_s),
	.state_o(sub_to_lin_s)
);
diffusion_layer Pl (
	.diffusion_i(sub_to_lin_s),
	.diffusion_o(lin_to_xor_end_s)
);





xor_end_perm Xor_end (
	.en_xor_lsb_i(en_xor_lsb_i), //active xor avec LSB en fin de DA
    .en_xor_key_i(en_xor_key_final_i), //active xor avec cle en fin initialisation, il sera égal à 1 pour la ronde finale
    .key_i(key_i),    // Valeur de la clé à xorer
    .state_i(lin_to_xor_end_s),   // Entrée du xor
    .state_o(xor_end_to_reg_s)   // Sortie du xor
);





state_register_w_en Registre (
	.clock_i(clock_i),
	.resetb_i(resetb_i),
	.en_i(en_i),
    .data_i(xor_end_to_reg_s),
	.data_o(state_o)
);



register_w_en register_tag (
	.clock_i(clock_i),
	.resetb_i(resetb_i),
	.en_i(en_out_tag_i),
    .data_i({state_o[3], state_o[4]}),
	.data_o(tag_o)
);




endmodule : permutation