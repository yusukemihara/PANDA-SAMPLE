name    xmlio;

bind    ""          "OpenCOBOL"  "XMLIO";
bind    "xmlio"     "OpenCOBOL"  "XMLIO";
bindapi "list"      "OpenCOBOL"  "LIST";

data {
    spa spa;
    window {
        xmlio;
        list;
    };
};

db "work" {
	work;
};

db "xml" {
	xml;
};
