name    session;

arraysize 20;
textsize 256;

bind	""				"OpenCOBOL"	"SESSIONEND";
bind	"session_end"	"OpenCOBOL"	"SESSIONEND";
bindapi	"session_start"	"OpenCOBOL"	"SESSIONSTART";

data {
    spa spa;
	window {
		session_end;
		session_start;
	};
};
