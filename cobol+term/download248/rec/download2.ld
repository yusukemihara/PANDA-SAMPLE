name    download2;

bind    ""           "OpenCOBOL"  "WINDOW1";
bind    "window1"    "OpenCOBOL"  "WINDOW1";
bindapi "download2"  "OpenCOBOL"  "DOWNLOAD2";

data {
    spa spa;
    window {
		window1;
        download2;
    };
};

db "work" {
	work;
};
