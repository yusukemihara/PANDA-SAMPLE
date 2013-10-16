name    imageupload;

handler "Ruby" {
    class       "Ruby";
    loadpath    "=/ruby";
    locale      "euc-jp";
};

bind    ""              "Ruby"  "ImageUpload";
bind    "imageupload"        "Ruby"  "ImageUpload";

data {
    spa imageupload_spa;
    window {
        imageupload;
    };
};

db "work"{
    work;
};

# Local Variables:
# indent-tabs-mode: nil
# tab-width: 4
# End:

