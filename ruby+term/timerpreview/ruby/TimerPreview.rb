class TimerPreview
  def start(node, db)
STDERR.puts "---- START"
    window = node.windows["timerpreview"]
    window.fixed1.pandapdf1.objectdata = 0
    window.fixed1.togglebutton1.value = true
    window.fixed1.pandatimer1.duration = 10
    node.put_window("NEW", "timerpreview")
  end

  def do_TIMEOUT(node, db)
STDERR.puts "---- TIMEOUT"
    window = node.windows["timerpreview"]
    db["work"].blob_import(nil, "file" => "./ruby/test.pdf")
    window.fixed1.pandapdf1.objectdata = db["work"].object
    node.put_window("", "timerpreview")
  end

  def do_CLICKED(node, db)
STDERR.puts "---- CLICKED"
    window = node.windows["timerpreview"]
STDERR.puts window.fixed1.togglebutton1.value
    if window.fixed1.togglebutton1.value
      window.fixed1.pandatimer1.duration = 5
    else 
      window.fixed1.pandatimer1.duration = 0
    end
    node.put_window("", "timerpreview")
  end

end

