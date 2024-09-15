// Module : FSM_TOP6
// Gevorg ISHKHAYAN
// Vendredi 14 Avril 2024

FSM_init FSM_inst (
    .clock_i(clock_i), 
    .resetb_i(resetb_i),
    .start_i(start_i),
    .round_i(round_s),
    .en_cpt_perm_o(en_cpt_perm_s), 
    .init_p6_o(init_p6_s), 
    .init_p12_o(init_p12_s),
    .input_mode_o(input_mode_s), 
    .en_reg_state_o(en_reg_state_s), 
    .xor_key_o(xor_key_s),
    .end_o(end_o)
);

// Initialisation du compteur double
compteur_double_init compteur_double_init (
    .clock_i(clock_i),
    .resetb_i(resetb_i),
    .cpt_o(round_s),
    .en_i(en_cpt_perm_s),
    .init_12_i(init_p12_s),
    .init_6_i(init_p6_s)
);

endmodule : ASCON_top_init