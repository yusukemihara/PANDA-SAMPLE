name    print;

bind    ""           "OpenCOBOL"  "SCREEN1";
bind    "screen1"    "OpenCOBOL"  "SCREEN1";
bindapi "print"      "OpenCOBOL"  "PRINT";

data {
    spa spa;
    window {
		screen1;
        print;
    };
};

db "work" {
	work;
};
