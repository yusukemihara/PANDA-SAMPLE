name    tick;

arraysize 20;
textsize 256;

bind	""		"OpenCOBOL"	"TICK";
bind	"tick"	"OpenCOBOL"	"TICK";
bindapi "api"	"OpenCOBOL" "API";

data {
    spa spa;
    window {
		tick;
		api;
    };
};
