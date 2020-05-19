`timescale 1ns / 1ps

module amplitude_visualiser(
    input clk20k,
    input [11:0] mic_in,
    input [12:0] pixel_index,
    output reg [15:0] oled_data
    );
    
    reg [14:0] counter;
    reg [5:0] sig0, sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8, sig9, sig10, sig11, sig12, sig13, sig14, sig15, sig16, sig17, sig18, sig19, sig20, sig21, sig22, sig23, sig24, sig25, sig26, sig27, sig28, sig29, sig30, sig31, sig32, sig33, sig34, sig35, sig36, sig37, sig38, sig39, sig40, sig41, sig42, sig43, sig44, sig45, sig46, sig47, sig48, sig49, sig50, sig51, sig52, sig53, sig54, sig55, sig56, sig57, sig58, sig59, sig60, sig61, sig62, sig63, sig64, sig65, sig66, sig67, sig68, sig69, sig70, sig71, sig72, sig73, sig74, sig75, sig76, sig77, sig78, sig79, sig80, sig81, sig82, sig83, sig84, sig85, sig86, sig87, sig88, sig89, sig90, sig91, sig92, sig93, sig94, sig95;
    reg [5:0] delayed0, delayed1, delayed2, delayed3, delayed4, delayed5, delayed6, delayed7, delayed8, delayed9, delayed10, delayed11, delayed12, delayed13, delayed14, delayed15, delayed16, delayed17, delayed18, delayed19, delayed20, delayed21, delayed22, delayed23, delayed24, delayed25, delayed26, delayed27, delayed28, delayed29, delayed30, delayed31, delayed32, delayed33, delayed34, delayed35, delayed36, delayed37, delayed38, delayed39, delayed40, delayed41, delayed42, delayed43, delayed44, delayed45, delayed46, delayed47, delayed48, delayed49, delayed50, delayed51, delayed52, delayed53, delayed54, delayed55, delayed56, delayed57, delayed58, delayed59, delayed60, delayed61, delayed62, delayed63, delayed64, delayed65, delayed66, delayed67, delayed68, delayed69, delayed70, delayed71, delayed72, delayed73, delayed74, delayed75, delayed76, delayed77, delayed78, delayed79, delayed80, delayed81, delayed82, delayed83, delayed84, delayed85, delayed86, delayed87, delayed88, delayed89, delayed90, delayed91, delayed92, delayed93, delayed94, delayed95;
    
    reg [6:0] x; 
    reg [5:0] y;
    
    reg [15:0] screen_colour = 16'b11111_111111_11111, dim_colour = 16'b01111_011111_01111;
    reg [15:0] random_colour, random_dim_colour;
    reg [2:0] colour_type;
    
    always @ mic_in begin
        colour_type = mic_in % 6;
        case (colour_type)
            0: begin
                random_colour = {5'b00000, mic_in[4:0], 1'b0, 5'b11111};
                random_dim_colour = {5'b00000, 1'b0, mic_in[4:1], 1'b0, 5'b01111};
            end
            1: begin
                random_colour = {5'b00000, 5'b11111, 1'b0, mic_in[4:0]};
                random_dim_colour = {5'b00000, 5'b01111, 1'b0, 1'b0, mic_in[4:1]};
            end
            2: begin
                random_colour = {mic_in[4:0], 5'b00000, 1'b0, 5'b11111};
                random_dim_colour = {1'b0, mic_in[4:1], 5'b00000, 1'b0, 5'b01111};
            end
            3: begin
                random_colour = {mic_in[4:0], 5'b11111, 1'b0, 5'b00000};
                random_dim_colour = {1'b0, mic_in[4:1], 5'b01111, 1'b0, 5'b00000};
            end
            4: begin
                random_colour = {5'b11111, 5'b00000, 1'b0, mic_in[4:0]};
                random_dim_colour = {5'b01111, 5'b00000, 1'b0, 1'b0, mic_in[4:1]};
            end
            5: begin
                random_colour = {5'b11111, mic_in[4:0], 1'b0, 5'b00000};
                random_dim_colour = {5'b01111, 1'b0, mic_in[4:1], 1'b0, 5'b00000};
            end
        endcase
    end
    
    always @ pixel_index begin
        oled_data = dim_colour;
        x = pixel_index % 96; // [0:95]
        y = pixel_index / 96; // [0:63]
        
        if (x == 0 && (y == delayed0 || y == (delayed0 + 1))) oled_data = screen_colour;
        if (x == 1 && (y == delayed1 || y == (delayed1 + 1))) oled_data = screen_colour;
        if (x == 2 && (y == delayed2 || y == (delayed2 + 1))) oled_data = screen_colour;
        if (x == 3 && (y == delayed3 || y == (delayed3 + 1))) oled_data = screen_colour;
        if (x == 4 && (y == delayed4 || y == (delayed4 + 1))) oled_data = screen_colour;
        if (x == 5 && (y == delayed5 || y == (delayed5 + 1))) oled_data = screen_colour;
        if (x == 6 && (y == delayed6 || y == (delayed6 + 1))) oled_data = screen_colour;
        if (x == 7 && (y == delayed7 || y == (delayed7 + 1))) oled_data = screen_colour;
        if (x == 8 && (y == delayed8 || y == (delayed8 + 1))) oled_data = screen_colour;
        if (x == 9 && (y == delayed9 || y == (delayed9 + 1))) oled_data = screen_colour;
        if (x == 10 && (y == delayed10 || y == (delayed10 + 1))) oled_data = screen_colour;
        if (x == 11 && (y == delayed11 || y == (delayed11 + 1))) oled_data = screen_colour;
        if (x == 12 && (y == delayed12 || y == (delayed12 + 1))) oled_data = screen_colour;
        if (x == 13 && (y == delayed13 || y == (delayed13 + 1))) oled_data = screen_colour;
        if (x == 14 && (y == delayed14 || y == (delayed14 + 1))) oled_data = screen_colour;
        if (x == 15 && (y == delayed15 || y == (delayed15 + 1))) oled_data = screen_colour;
        if (x == 16 && (y == delayed16 || y == (delayed16 + 1))) oled_data = screen_colour;
        if (x == 17 && (y == delayed17 || y == (delayed17 + 1))) oled_data = screen_colour;
        if (x == 18 && (y == delayed18 || y == (delayed18 + 1))) oled_data = screen_colour;
        if (x == 19 && (y == delayed19 || y == (delayed19 + 1))) oled_data = screen_colour;
        if (x == 20 && (y == delayed20 || y == (delayed20 + 1))) oled_data = screen_colour;
        if (x == 21 && (y == delayed21 || y == (delayed21 + 1))) oled_data = screen_colour;
        if (x == 22 && (y == delayed22 || y == (delayed22 + 1))) oled_data = screen_colour;
        if (x == 23 && (y == delayed23 || y == (delayed23 + 1))) oled_data = screen_colour;
        if (x == 24 && (y == delayed24 || y == (delayed24 + 1))) oled_data = screen_colour;
        if (x == 25 && (y == delayed25 || y == (delayed25 + 1))) oled_data = screen_colour;
        if (x == 26 && (y == delayed26 || y == (delayed26 + 1))) oled_data = screen_colour;
        if (x == 27 && (y == delayed27 || y == (delayed27 + 1))) oled_data = screen_colour;
        if (x == 28 && (y == delayed28 || y == (delayed28 + 1))) oled_data = screen_colour;
        if (x == 29 && (y == delayed29 || y == (delayed29 + 1))) oled_data = screen_colour;
        if (x == 30 && (y == delayed30 || y == (delayed30 + 1))) oled_data = screen_colour;
        if (x == 31 && (y == delayed31 || y == (delayed31 + 1))) oled_data = screen_colour;
        if (x == 32 && (y == delayed32 || y == (delayed32 + 1))) oled_data = screen_colour;
        if (x == 33 && (y == delayed33 || y == (delayed33 + 1))) oled_data = screen_colour;
        if (x == 34 && (y == delayed34 || y == (delayed34 + 1))) oled_data = screen_colour;
        if (x == 35 && (y == delayed35 || y == (delayed35 + 1))) oled_data = screen_colour;
        if (x == 36 && (y == delayed36 || y == (delayed36 + 1))) oled_data = screen_colour;
        if (x == 37 && (y == delayed37 || y == (delayed37 + 1))) oled_data = screen_colour;
        if (x == 38 && (y == delayed38 || y == (delayed38 + 1))) oled_data = screen_colour;
        if (x == 39 && (y == delayed39 || y == (delayed39 + 1))) oled_data = screen_colour;
        if (x == 40 && (y == delayed40 || y == (delayed40 + 1))) oled_data = screen_colour;
        if (x == 41 && (y == delayed41 || y == (delayed41 + 1))) oled_data = screen_colour;
        if (x == 42 && (y == delayed42 || y == (delayed42 + 1))) oled_data = screen_colour;
        if (x == 43 && (y == delayed43 || y == (delayed43 + 1))) oled_data = screen_colour;
        if (x == 44 && (y == delayed44 || y == (delayed44 + 1))) oled_data = screen_colour;
        if (x == 45 && (y == delayed45 || y == (delayed45 + 1))) oled_data = screen_colour;
        if (x == 46 && (y == delayed46 || y == (delayed46 + 1))) oled_data = screen_colour;
        if (x == 47 && (y == delayed47 || y == (delayed47 + 1))) oled_data = screen_colour;
        if (x == 48 && (y == delayed48 || y == (delayed48 + 1))) oled_data = screen_colour;
        if (x == 49 && (y == delayed49 || y == (delayed49 + 1))) oled_data = screen_colour;
        if (x == 50 && (y == delayed50 || y == (delayed50 + 1))) oled_data = screen_colour;
        if (x == 51 && (y == delayed51 || y == (delayed51 + 1))) oled_data = screen_colour;
        if (x == 52 && (y == delayed52 || y == (delayed52 + 1))) oled_data = screen_colour;
        if (x == 53 && (y == delayed53 || y == (delayed53 + 1))) oled_data = screen_colour;
        if (x == 54 && (y == delayed54 || y == (delayed54 + 1))) oled_data = screen_colour;
        if (x == 55 && (y == delayed55 || y == (delayed55 + 1))) oled_data = screen_colour;
        if (x == 56 && (y == delayed56 || y == (delayed56 + 1))) oled_data = screen_colour;
        if (x == 57 && (y == delayed57 || y == (delayed57 + 1))) oled_data = screen_colour;
        if (x == 58 && (y == delayed58 || y == (delayed58 + 1))) oled_data = screen_colour;
        if (x == 59 && (y == delayed59 || y == (delayed59 + 1))) oled_data = screen_colour;
        if (x == 60 && (y == delayed60 || y == (delayed60 + 1))) oled_data = screen_colour;
        if (x == 61 && (y == delayed61 || y == (delayed61 + 1))) oled_data = screen_colour;
        if (x == 62 && (y == delayed62 || y == (delayed62 + 1))) oled_data = screen_colour;
        if (x == 63 && (y == delayed63 || y == (delayed63 + 1))) oled_data = screen_colour;
        if (x == 64 && (y == delayed64 || y == (delayed64 + 1))) oled_data = screen_colour;
        if (x == 65 && (y == delayed65 || y == (delayed65 + 1))) oled_data = screen_colour;
        if (x == 66 && (y == delayed66 || y == (delayed66 + 1))) oled_data = screen_colour;
        if (x == 67 && (y == delayed67 || y == (delayed67 + 1))) oled_data = screen_colour;
        if (x == 68 && (y == delayed68 || y == (delayed68 + 1))) oled_data = screen_colour;
        if (x == 69 && (y == delayed69 || y == (delayed69 + 1))) oled_data = screen_colour;
        if (x == 70 && (y == delayed70 || y == (delayed70 + 1))) oled_data = screen_colour;
        if (x == 71 && (y == delayed71 || y == (delayed71 + 1))) oled_data = screen_colour;
        if (x == 72 && (y == delayed72 || y == (delayed72 + 1))) oled_data = screen_colour;
        if (x == 73 && (y == delayed73 || y == (delayed73 + 1))) oled_data = screen_colour;
        if (x == 74 && (y == delayed74 || y == (delayed74 + 1))) oled_data = screen_colour;
        if (x == 75 && (y == delayed75 || y == (delayed75 + 1))) oled_data = screen_colour;
        if (x == 76 && (y == delayed76 || y == (delayed76 + 1))) oled_data = screen_colour;
        if (x == 77 && (y == delayed77 || y == (delayed77 + 1))) oled_data = screen_colour;
        if (x == 78 && (y == delayed78 || y == (delayed78 + 1))) oled_data = screen_colour;
        if (x == 79 && (y == delayed79 || y == (delayed79 + 1))) oled_data = screen_colour;
        if (x == 80 && (y == delayed80 || y == (delayed80 + 1))) oled_data = screen_colour;
        if (x == 81 && (y == delayed81 || y == (delayed81 + 1))) oled_data = screen_colour;
        if (x == 82 && (y == delayed82 || y == (delayed82 + 1))) oled_data = screen_colour;
        if (x == 83 && (y == delayed83 || y == (delayed83 + 1))) oled_data = screen_colour;
        if (x == 84 && (y == delayed84 || y == (delayed84 + 1))) oled_data = screen_colour;
        if (x == 85 && (y == delayed85 || y == (delayed85 + 1))) oled_data = screen_colour;
        if (x == 86 && (y == delayed86 || y == (delayed86 + 1))) oled_data = screen_colour;
        if (x == 87 && (y == delayed87 || y == (delayed87 + 1))) oled_data = screen_colour;
        if (x == 88 && (y == delayed88 || y == (delayed88 + 1))) oled_data = screen_colour;
        if (x == 89 && (y == delayed89 || y == (delayed89 + 1))) oled_data = screen_colour;
        if (x == 90 && (y == delayed90 || y == (delayed90 + 1))) oled_data = screen_colour;
        if (x == 91 && (y == delayed91 || y == (delayed91 + 1))) oled_data = screen_colour;
        if (x == 92 && (y == delayed92 || y == (delayed92 + 1))) oled_data = screen_colour;
        if (x == 93 && (y == delayed93 || y == (delayed93 + 1))) oled_data = screen_colour;
        if (x == 94 && (y == delayed94 || y == (delayed94 + 1))) oled_data = screen_colour;
        if (x == 95 && (y == delayed95 || y == (delayed95 + 1))) oled_data = screen_colour;
    end
    
    always @ (posedge clk20k) begin
        case (counter)
            0: begin 
                sig0 <= mic_in[11:6];
                delayed0 <= sig0;
                screen_colour <= random_colour;
                dim_colour <= random_dim_colour;
            end
            1: sig1 <= mic_in[11:6];
            2: sig2 <= mic_in[11:6];
            3: sig3 <= mic_in[11:6];
            4: sig4 <= mic_in[11:6];
            5: sig5 <= mic_in[11:6];
            6: sig6 <= mic_in[11:6];
            7: sig7 <= mic_in[11:6];
            8: sig8 <= mic_in[11:6];
            9: sig9 <= mic_in[11:6];
            10: sig10 <= mic_in[11:6];
            11: sig11 <= mic_in[11:6];
            12: sig12 <= mic_in[11:6];
            13: sig13 <= mic_in[11:6];
            14: sig14 <= mic_in[11:6];
            15: sig15 <= mic_in[11:6];
            16: sig16 <= mic_in[11:6];
            17: sig17 <= mic_in[11:6];
            18: sig18 <= mic_in[11:6];
            19: sig19 <= mic_in[11:6];
            20: sig20 <= mic_in[11:6];
            21: sig21 <= mic_in[11:6];
            22: sig22 <= mic_in[11:6];
            23: sig23 <= mic_in[11:6];
            24: sig24 <= mic_in[11:6];
            25: sig25 <= mic_in[11:6];
            26: sig26 <= mic_in[11:6];
            27: sig27 <= mic_in[11:6];
            28: sig28 <= mic_in[11:6];
            29: sig29 <= mic_in[11:6];
            30: sig30 <= mic_in[11:6];
            31: sig31 <= mic_in[11:6];
            32: sig32 <= mic_in[11:6];
            33: sig33 <= mic_in[11:6];
            34: sig34 <= mic_in[11:6];
            35: sig35 <= mic_in[11:6];
            36: sig36 <= mic_in[11:6];
            37: sig37 <= mic_in[11:6];
            38: sig38 <= mic_in[11:6];
            39: sig39 <= mic_in[11:6];
            40: sig40 <= mic_in[11:6];
            41: sig41 <= mic_in[11:6];
            42: sig42 <= mic_in[11:6];
            43: sig43 <= mic_in[11:6];
            44: sig44 <= mic_in[11:6];
            45: sig45 <= mic_in[11:6];
            46: sig46 <= mic_in[11:6];
            47: sig47 <= mic_in[11:6];
            48: sig48 <= mic_in[11:6];
            49: sig49 <= mic_in[11:6];
            50: sig50 <= mic_in[11:6];
            51: sig51 <= mic_in[11:6];
            52: sig52 <= mic_in[11:6];
            53: sig53 <= mic_in[11:6];
            54: sig54 <= mic_in[11:6];
            55: sig55 <= mic_in[11:6];
            56: sig56 <= mic_in[11:6];
            57: sig57 <= mic_in[11:6];
            58: sig58 <= mic_in[11:6];
            59: sig59 <= mic_in[11:6];
            60: sig60 <= mic_in[11:6];
            61: sig61 <= mic_in[11:6];
            62: sig62 <= mic_in[11:6];
            63: sig63 <= mic_in[11:6];
            64: sig64 <= mic_in[11:6];
            65: sig65 <= mic_in[11:6];
            66: sig66 <= mic_in[11:6];
            67: sig67 <= mic_in[11:6];
            68: sig68 <= mic_in[11:6];
            69: sig69 <= mic_in[11:6];
            70: sig70 <= mic_in[11:6];
            71: sig71 <= mic_in[11:6];
            72: sig72 <= mic_in[11:6];
            73: sig73 <= mic_in[11:6];
            74: sig74 <= mic_in[11:6];
            75: sig75 <= mic_in[11:6];
            76: sig76 <= mic_in[11:6];
            77: sig77 <= mic_in[11:6];
            78: sig78 <= mic_in[11:6];
            79: sig79 <= mic_in[11:6];
            80: sig80 <= mic_in[11:6];
            81: sig81 <= mic_in[11:6];
            82: sig82 <= mic_in[11:6];
            83: sig83 <= mic_in[11:6];
            84: sig84 <= mic_in[11:6];
            85: sig85 <= mic_in[11:6];
            86: sig86 <= mic_in[11:6];
            87: sig87 <= mic_in[11:6];
            88: sig88 <= mic_in[11:6];
            89: sig89 <= mic_in[11:6];
            90: sig90 <= mic_in[11:6];
            91: sig91 <= mic_in[11:6];
            92: sig92 <= mic_in[11:6];
            93: sig93 <= mic_in[11:6];
            94: sig94 <= mic_in[11:6];
            95: sig95 <= mic_in[11:6];
            104: delayed1 <= sig1;
            208: delayed2 <= sig2;
            312: delayed3 <= sig3;
            416: delayed4 <= sig4;
            520: delayed5 <= sig5;
            624: delayed6 <= sig6;
            728: delayed7 <= sig7;
            832: delayed8 <= sig8;
            936: delayed9 <= sig9;
            1040: delayed10 <= sig10;
            1144: delayed11 <= sig11;
            1248: delayed12 <= sig12;
            1352: delayed13 <= sig13;
            1456: delayed14 <= sig14;
            1560: delayed15 <= sig15;
            1664: delayed16 <= sig16;
            1768: delayed17 <= sig17;
            1872: delayed18 <= sig18;
            1976: delayed19 <= sig19;
            2080: delayed20 <= sig20;
            2184: delayed21 <= sig21;
            2288: delayed22 <= sig22;
            2392: delayed23 <= sig23;
            2496: delayed24 <= sig24;
            2600: delayed25 <= sig25;
            2704: delayed26 <= sig26;
            2808: delayed27 <= sig27;
            2912: delayed28 <= sig28;
            3016: delayed29 <= sig29;
            3120: delayed30 <= sig30;
            3224: delayed31 <= sig31;
            3328: delayed32 <= sig32;
            3432: delayed33 <= sig33;
            3536: delayed34 <= sig34;
            3640: delayed35 <= sig35;
            3744: delayed36 <= sig36;
            3848: delayed37 <= sig37;
            3952: delayed38 <= sig38;
            4056: delayed39 <= sig39;
            4160: delayed40 <= sig40;
            4264: delayed41 <= sig41;
            4368: delayed42 <= sig42;
            4472: delayed43 <= sig43;
            4576: delayed44 <= sig44;
            4680: delayed45 <= sig45;
            4784: delayed46 <= sig46;
            4888: delayed47 <= sig47;
            4992: delayed48 <= sig48;
            5096: delayed49 <= sig49;
            5200: delayed50 <= sig50;
            5304: delayed51 <= sig51;
            5408: delayed52 <= sig52;
            5512: delayed53 <= sig53;
            5616: delayed54 <= sig54;
            5720: delayed55 <= sig55;
            5824: delayed56 <= sig56;
            5928: delayed57 <= sig57;
            6032: delayed58 <= sig58;
            6136: delayed59 <= sig59;
            6240: delayed60 <= sig60;
            6344: delayed61 <= sig61;
            6448: delayed62 <= sig62;
            6552: delayed63 <= sig63;
            6656: delayed64 <= sig64;
            6760: delayed65 <= sig65;
            6864: delayed66 <= sig66;
            6968: delayed67 <= sig67;
            7072: delayed68 <= sig68;
            7176: delayed69 <= sig69;
            7280: delayed70 <= sig70;
            7384: delayed71 <= sig71;
            7488: delayed72 <= sig72;
            7592: delayed73 <= sig73;
            7696: delayed74 <= sig74;
            7800: delayed75 <= sig75;
            7904: delayed76 <= sig76;
            8008: delayed77 <= sig77;
            8112: delayed78 <= sig78;
            8216: delayed79 <= sig79;
            8320: delayed80 <= sig80;
            8424: delayed81 <= sig81;
            8528: delayed82 <= sig82;
            8632: delayed83 <= sig83;
            8736: delayed84 <= sig84;
            8840: delayed85 <= sig85;
            8944: delayed86 <= sig86;
            9048: delayed87 <= sig87;
            9152: delayed88 <= sig88;
            9256: delayed89 <= sig89;
            9360: delayed90 <= sig90;
            9464: delayed91 <= sig91;
            9568: delayed92 <= sig92;
            9672: delayed93 <= sig93;
            9776: delayed94 <= sig94;
            9880: delayed95 <= sig95;
        endcase
    
        counter <= (counter == 9999) ? 0 : counter + 1;
    end
endmodule
