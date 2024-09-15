// GEVORG ISHKHANYAN
// Jeudi 04 Avril 2024
// Permutation , une seule (sans XOR)

import ascon_pack::* ;

`timescale 1ns / 1ps

module permutation_step_1 (
	input logic sel_i,
    input logic clock_i,
    input logic resetb_i,
    input logic en_i,
    input type_state state_i,
    input logic[3:0] round_i,
	output logic state_o
);

// Internal net declaration
type_state mux_to_state_s, const_to_sub_s, sub_to_lin_s, lin_to_reg_s, state_s;
//Structural declaration
mux_state Multiplexeur (
	.sel_i(sel_i),
	.data1_i(state_i),
	.data2_i(state_s),
	.data_o(mux_to_state_s)
);


constant_addition Pc (
	.state_i(mux_to_state_s),
	.round_i(round_i),
	.state_o(const_to_sub_s)
);

substitution_layer Ps (
	.state_i(const_to_sub_s),
	.state_o(sub_to_lin_s)
);

diffusion_layer Pl (
	.diffusion_i(sub_to_lin_s),
	.diffusion_o(lin_to_reg_s)
);


state_register_w_en Registre (
	.clock_i(clock_i),
	.resetb_i(resetb_i),
	.en_i(en_i),
    .data_i(lin_to_reg_s),
	.data_o(state_s)
);

assign state_o = state_s;

endmodule : permutation_step_1
