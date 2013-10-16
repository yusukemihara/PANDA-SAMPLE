name    api47;

handler "Ruby" {
	class		"Ruby";
	loadpath	"=/ruby";
	locale 		"utf-8";
};

bindapi "api47"      "Ruby"  "Api47";

data {
    spa spa;
    window {
        api47;
    };
};

db "work" {
	work;
};
