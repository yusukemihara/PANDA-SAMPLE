class Upload
  def start(node, db)
STDERR.puts "---- START"
    window = node.windows["upload"]
    item = db["work"].blob_import(nil, "file" => "./ruby/demo.ps")
    window.vbox2.pandaps1.objectdata = item.object
	#window.vbox2.fileentry1.objectdata = 0
    window.vbox2.fileentry1.entry1.value = ""
    node.put_window("NEW", "upload")
STDERR.puts "---- START END"
  end

  def do_CLICKED(node, db)
STDERR.puts "---- do_CLICKED"
    window = node.windows["upload"]
    window.vbox2.pandaps1.objectdata = window.vbox2.fileentry1.objectdata
	window.vbox2.fileentry1.objectdata = 0
    node.put_window
STDERR.puts "---- do_CLICKED END"
  end

end

