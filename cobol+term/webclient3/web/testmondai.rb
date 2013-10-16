$:.unshift('/usr/lib/')
require 'rubymondai.so'

val = Rubymondai::RecordValue.new(File.read("../rec/window1.rec"))

p val.size
p val["title"]
p val["popup_summary"]
p val["fixed1"]
p val["fixed1.label1.labeldata1"]
p val.children_longnames

val["title"] = "moge"
val["popup_timeout"] = 100

packed = val.native_pack

val2 = Rubymondai::RecordValue.new(File.read("../rec/window1.rec"))

val2.native_unpack packed

p val2["title"]
p val2["popup_timeout"]
