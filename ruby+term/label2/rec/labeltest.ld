name    labeltest;

handler "Ruby" {
	class		"Ruby";
	loadpath	"=/ruby";
	locale 		"utf-8";
};

bind	""			"Ruby"	"Label";
bind	"labeltest"	"Ruby"	"Label";

data {
    spa spa;
    window {
		labeltest;
    };
};
