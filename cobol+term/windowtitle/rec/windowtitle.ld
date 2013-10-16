name    windowtitle;

bind    ""               "OpenCOBOL"  "WINDOWTITLE";
bind    "windowtitle"    "OpenCOBOL"  "WINDOWTITLE";
bindapi "action01"  	 "OpenCOBOL"  "ACTION01";
bindapi "action02"    	 "OpenCOBOL"  "ACTION02";
bindapi "post" 		   	 "OpenCOBOL"  "POST";

data {
    spa windowtitle_spa;
    window {
        windowtitle;
		action01;
		action02;
		post;
    };
};

# Local Variables:
# indent-tabs-mode: nil
# tab-width: 4
# End:
