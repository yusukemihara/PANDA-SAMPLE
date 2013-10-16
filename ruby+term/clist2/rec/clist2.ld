name    clist2;

handler "Ruby" {
	class		"Ruby";
	loadpath	"=/ruby";
	locale 		"utf-8";
};

bind	""			"Ruby"	"CList2";
bind	"clist2"	"Ruby"	"CList2";

data {
    spa spa;
    window {
		clist2;
    };
};
