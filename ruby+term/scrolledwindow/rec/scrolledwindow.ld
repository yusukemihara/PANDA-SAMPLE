name    scrolledwindow;

handler "Ruby" {
    class       "Ruby";
    loadpath    "=/ruby";
    locale      "euc-jp";
};

bind    ""              		"Ruby"  "ScrolledWindow";
bind    "scrolledwindow"        "Ruby"  "ScrolledWindow";

data {
    spa scrolledwindow_spa;
    window {
        scrolledwindow;
    };
};

db "work"{
    work;
};

# Local Variables:
# indent-tabs-mode: nil
# tab-width: 4
# End:

