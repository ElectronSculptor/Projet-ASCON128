// Gevorg ISHKHANYAN
// Test Bench pour la diffusion layer
// Mercredi 14 Avril 2024

`timescale 1 ns/ 1 ps

import ascon_pack ::*;

module substitution_layer_tb();

    // Parameters and local variables
    type_state state_i_s , state_o_s;



    substitution_layer DUT (
    .state_i(state_i_s),
    .state_o(state_o_s)
    );

    // Stimuli de test
    initial begin

    state_i_s[0] = 64'h80400c0600000000;
    state_i_s[1] = 64'h8a55114d1cb6a9a2;
    state_i_s[2] = 64'hbe263d4d7aecaa0f;
    state_i_s[3] = 64'h4ed0ec0b98c529b7;
    state_i_s[4] = 64'hc8cddf37bcd0284a;
    #10;

    end
endmodule : substitution_layer_tb //substitution_layer_tb