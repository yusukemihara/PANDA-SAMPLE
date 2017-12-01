name    testld;

bindapi "api1"      "OpenCOBOL"  "API1";
bindapi "api2"      "OpenCOBOL"  "API2";

data {
    spa spa;
    window {
        api1;
        api2;
    };
};

db "blob" {
	blob;
};

db "msg" {
	msg;
};
