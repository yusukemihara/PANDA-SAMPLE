class ImageUpload
  def start(node, db)
STDERR.puts "---- START"
    window = node.windows["imageupload"]
    item = db["work"].blob_import(nil, "file" => "./ruby/demo.png")
    window.hbox1.pixmap1.objectdata = item.object
    window.hbox1.vbox2.pixmapentry1.entry1.value = ""
    node.put_window("NEW", "imageupload")
STDERR.puts "---- START END"
  end

  def do_CLICKED(node, db)
STDERR.puts "---- do_CLICKED"
    window = node.windows["imageupload"]
    window.hbox1.pixmap1.objectdata = window.hbox1.vbox2.pixmapentry1.objectdata
STDERR.puts window.hbox1.vbox2.pixmapentry1.objectdata
    window.hbox1.vbox2.pixmapentry1.objectdata = 0
    node.put_window
STDERR.puts "---- do_CLICKED END"
  end

end

