name    registblob;

bind    ""               "OpenCOBOL"  "REGISTBLOB";
bind    "registblob"     "OpenCOBOL"  "REGISTBLOB";

data {
    spa registblob_spa;
    window {
        registblob;
    };
};

db "work" {
	work;
};
