class CList
  ROWS = 100
  def start(node, db)
STDERR.puts "---- START"
    w = node.windows["clist"]
    w.swindow1.pclist1.count = ROWS
    w.swindow1.pclist1.row = 0
    ROWS.times{|i|
      w.swindow1.pclist1.item[i].value0 = "##{i}"
      w.swindow1.pclist1.item[i].value1 = "##{i}"
      w.swindow1.pclist1.select[i] = false
    }
    node.put_window("NEW", "clist")
STDERR.puts "---- START END"
  end

  def do_SELECT(node, db)
STDERR.puts "---- do_SELECT"
    w = node.windows["clist"]
STDERR.puts "selected #{w.swindow1.pclist1.row}"
    node.put_window
    w.swindow1.vpos = 0.0
    w.swindow1.hpos = 4.0
    w.swindow1.pclist1.row = 50
STDERR.puts "---- do_SELECT END"
  end

end

