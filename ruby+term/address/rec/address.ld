name    address;

handler "Ruby" {
    class       "Ruby";
    loadpath    "=/ruby";
    locale      "euc-jp";
};

bind    ""          "Ruby"	"Address";
bind    "address"	"Ruby"	"Address";

data {
    spa address_spa;
    window {
        address;
    };
};

db {
    address;
};

# Local Variables:
# indent-tabs-mode: nil
# tab-width: 4
# End:
