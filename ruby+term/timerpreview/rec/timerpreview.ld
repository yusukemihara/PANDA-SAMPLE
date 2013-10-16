name    timerpreview;

handler "Ruby" {
	class		"Ruby";
	loadpath	"=/ruby";
	locale 		"utf-8";
};

bind	""			"Ruby"	"TimerPreview";
bind	"timerpreview"	"Ruby"	"TimerPreview";

data {
    spa spa;
    window {
		timerpreview;
    };
};

db "work" {
	work;
};
