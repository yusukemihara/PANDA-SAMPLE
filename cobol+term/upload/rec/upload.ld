name    upload;

bind    ""              "OpenCOBOL"  "UPLOAD";
bind    "upload"    "OpenCOBOL"  "UPLOAD";

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

