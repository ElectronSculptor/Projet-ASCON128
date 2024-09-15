// Gevorg ISHKHANYAN
// Projet ASCON : Fonction Ps, avec des entrées de 320 bits.
// Doit chercher les 5 bits de la s_box qui correspond à chaque colonne
// Mercredi 27 Mars 2024

import ascon_pack::*;

// Fait à partir d'un modèle du cours

module substitution_layer(
   input  type_state state_i,
   output type_state state_o
);

genvar i;
generate 
   for (i = 0; i < 64; i++) begin : parcours_64bits
     ascon_sbox ascon_sbox_instance(
         .sbox_i({state_i[0][i],state_i[1][i],state_i[2][i],state_i[3][i],state_i[4][i]}),
         .sbox_o({state_o[0][i],state_o[1][i],state_o[2][i],state_o[3][i],state_o[4][i]})
     );
   end : parcours_64bits
endgenerate 

endmodule : substitution_layer