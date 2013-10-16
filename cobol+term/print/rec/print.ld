name    print;

bind    ""           "OpenCOBOL"  "SCREEN1";
bind    "screen1"    "OpenCOBOL"  "SCREEN1";
bind    "screen2"    "OpenCOBOL"  "SCREEN2";
bindapi "print"      "OpenCOBOL"  "PRINT";

data {
    spa print_spa;
    window {
		screen1;
		screen2;
        print;
    };
};

db "work" {
	work;
};
