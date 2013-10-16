name    upload;

handler "Ruby" {
    class       "Ruby";
    loadpath    "=/ruby";
    locale      "euc-jp";
};

bind    ""              "Ruby"  "Upload";
bind    "upload"        "Ruby"  "Upload";

data {
    spa upload_spa;
    window {
        upload;
    };
};

db "work"{
    work;
};

# Local Variables:
# indent-tabs-mode: nil
# tab-width: 4
# End:

