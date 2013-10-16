class Viewport
  def initialize
    @times = 0
  end


  def start(node, db)
STDERR.puts "---- START"
    w = node.windows["viewport"]
    w.swindow1.viewport1.fixed1.entry1.value = "none"
    node.put_window("NEW", "viewport")
STDERR.puts "---- START END"
  end

  def do_CLICKED(node, db)
STDERR.puts "---- do_CLICKED"
    @times += 100
    w = node.windows["viewport"]
STDERR.puts "vpos:#{w.swindow1.vpos} hpos:#{w.swindow1.hpos}"
    w.swindow1.vpos = 600.0
    w.swindow1.hpos = 600.0
STDERR.puts "b #{w.swindow1.viewport1.fixed1.entry1.value} #{@times}"
    w.swindow1.viewport1.fixed1.entry1.value = "Clicked #{@times} times!!!"
STDERR.puts "a #{w.swindow1.viewport1.fixed1.entry1.value}"
STDERR.puts "vpos:#{w.swindow1.vpos} hpos:#{w.swindow1.hpos}"
    node.put_window
STDERR.puts "---- do_CLICKED END"
  end

end

