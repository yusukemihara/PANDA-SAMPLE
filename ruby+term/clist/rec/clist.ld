name    clist;

handler "Ruby" {
    class       "Ruby";
    loadpath    "=/ruby";
    locale      "euc-jp";
};

bind    ""             "Ruby"  "CList";
bind    "clist"        "Ruby"  "CList";

data {
    spa clist_spa;
    window {
        clist;
    };
};

db "work"{
    work;
};

# Local Variables:
# indent-tabs-mode: nil
# tab-width: 4
# End:

