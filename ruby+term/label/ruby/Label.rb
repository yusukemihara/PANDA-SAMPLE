class Label
  def start(node, db)
STDERR.puts "---- START"
    window = node.windows["labeltest"]
    window.popup_summary = ""
    window.popup_body = ""
    window.popup_icon = ""
    window.fixed1.label1.style = ""
    window.fixed1.label1.ltext = %!noge<span color="blue">hoge</span>moge!
    window.fixed1.pandaentry1.etext = ""
    node.put_window("NEW", "labeltest")
STDERR.puts "---- START END"
  end

  def do_activate(node, db)
STDERR.puts "---- do_activate"
    window = node.windows["labeltest"]
    window.fixed1.label1.ltext = window.fixed1.pandaentry1.etext
    node.put_window
STDERR.puts "---- do_activate END"
  end

end

