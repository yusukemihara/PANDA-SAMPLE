name    dummywindow;

bind	""			"OpenCOBOL"	"WINDOW1";
bind	"window1"	"OpenCOBOL"	"WINDOW1";
bind	"window2"	"OpenCOBOL"	"WINDOW2";
bind	"_dummy"	"OpenCOBOL"	"DUMMY";

data {
    spa spa;
    window {
		window1;
		window2;
		_dummy;
    };
};
