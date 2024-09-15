// Gevorg ISHKHANYAN
// Test Bench pour ASCON_TOP, pour la phase d'initialisation
// Création 23/04/24

`timescale 1ps/1ps

module ASCON_top_init_tb (

);

// Signaux interconnexion
    logic clock_s, resetb_s;
    logic start_s;
    logic end_s;

// DUT
    ASCON_top_init DUT (
        .clock_i(clock_s),
        .resetb_i(resetb_s),
        .start_i(start_s),
        .end_o(end_s)
    );


// Stimuli du test bench

    // Horloge
    always
    begin
        #10;
        clock_s = ~clock_s;
    end

    // Gestion du reset et du start
    initial
    begin
        start_s = 1'b0;
        resetb_s = 1'b0;
        #2;
        resetb_s = 1'b1;
        #35;
        start_s = 1'b1;
        #20;
        start_s = 1'b0;

        
    end





endmodule : ASCON_top_init_tb