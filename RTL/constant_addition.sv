// Gevorg ISHKHANYAN
// Addition de la constante de ronde
// Création Mercredi 13/03/24

import ascon_pack::* ;

module constant_addition 
(
	input type_state state_i,
	input logic[3:0] round_i,
	output type_state state_o
);


// Description de l'addition de constante

	assign state_o[0] = state_i[0];
	assign state_o[1] = state_i[1];

	assign state_o[2][63:8] = state_i[2][63:8];
	assign state_o[2][7:0] = state_i[2][7:0] ^ round_constant[round_i];
	
	assign state_o[3] = state_i[3];
	assign state_o[4] = state_i[4];



endmodule : constant_addition
