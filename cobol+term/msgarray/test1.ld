name    test1;

bindapi "test1"      "OpenCOBOL"  "TEST1";
bindapi "test2"      "OpenCOBOL"  "TEST2";
bindapi "test3"      "OpenCOBOL"  "TEST3";

data {
    spa spa;
    window {
        test1;
        test2;
        test3;
    };
};

db {
	dummy;
};

db "blob" {
	blob;
};

db "msgarray" {
	msg1;
};
