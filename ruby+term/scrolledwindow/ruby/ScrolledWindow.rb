require 'pp'
class ScrolledWindow
  def start(node, db)
STDERR.puts "---- START"
    window = node.windows["scrolledwindow"]
    window.vbox1.sw1.hpos = 0
    window.vbox1.sw1.vpos = 0
    window.vbox1.sw1.tx1.value = "This is test..."
    node.put_window("NEW", "scrolledwindow")
STDERR.puts "---- START END"
  end

  def do_CLICKED(node, db)
STDERR.puts "---- do_CLICKED"
    window = node.windows["scrolledwindow"]
STDERR.printf("hpos:%s vpos:%s\n",window.vbox1.sw1.hpos, window.vbox1.sw1.hpos)
    msg = ""
    1000.times {|i| msg += "#{i} hoge\n"}
    window.vbox1.sw1.hpos = 500
    window.vbox1.sw1.vpos = 500
    window.vbox1.sw1.tx1.value = msg
    node.put_window
STDERR.puts "---- do_CLICKED END"
  end

end

