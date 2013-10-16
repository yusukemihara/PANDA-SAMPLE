name    viewport;

handler "Ruby" {
    class       "Ruby";
    loadpath    "=/ruby";
    locale      "euc-jp";
};

bind    ""         	"Ruby"  "Viewport";
bind    "viewport"	"Ruby"  "Viewport";

data {
    spa viewport_spa;
    window {
        viewport;
    };
};

db "work"{
    work;
};

# Local Variables:
# indent-tabs-mode: nil
# tab-width: 4
# End:

