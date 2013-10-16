name    dbtest;

handler "Ruby" {
	class		"Ruby";
	loadpath	"=/ruby";
	locale 		"utf-8";
};

bind	""			"Ruby"	"Window1";
bind	"window1"	"Ruby"	"Window1";
bind	"window2"	"Ruby"	"Window2";

data {
    spa spa;
    window {
		window1;
		window2;
    };
};

db {
	test;
};
