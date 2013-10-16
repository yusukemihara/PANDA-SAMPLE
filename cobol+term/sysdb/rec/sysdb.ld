name    sysdb;

bind    ""       "OpenCOBOL"  "SYSDB";
bind    "sysdb"  "OpenCOBOL"  "SYSDB";

data {
    spa spa;
    window {
        sysdb;
    };
};

db "system" {
	system;
};
