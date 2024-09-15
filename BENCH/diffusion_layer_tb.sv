// Gevorg ISHKHANYAN
// Test Bench pour la diffusion layer
// Mercredi 14 Avril 2024

`timescale 1 ns/ 1 ps

import ascon_pack ::*;

module diffusion_layer_tb ();
    type_state state_i_s;
    type_state state_o_s;

    diffusion_layer DUT (
    .diffusion_i(state_i_s),
    .diffusion_o(state_o_s)

    );
    initial begin

        state_i_s[0] = 64'h78e2cc41faabaa1a;
        state_i_s[1] = 64'hbc7a2e775aababf7;
        state_i_s[2] = 64'h4b81c0cbbdb5fc1a;
        state_i_s[3] = 64'hb22e133e424f0250;
        state_i_s[4] = 64'h044d33702433805d;
        #10;
    end
endmodule : diffusion_layer_tb