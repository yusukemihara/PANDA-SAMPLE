name    test1;

bind	""			"OpenCOBOL"	"WINDOW1";
bind	"window1"	"OpenCOBOL"	"WINDOW1";
bind	"window2"	"OpenCOBOL"	"WINDOW2";

data {
    spa spa1;
    window {
		window1;
		window2;
    };
};
