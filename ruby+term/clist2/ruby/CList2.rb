class CList2
  ROWS = 100
  def start(node, db)
STDERR.puts "---- START"
    w = node.windows["clist2"]
    w.fixed1.scrolledwindow1.pandaclist1.count = ROWS
    w.fixed1.scrolledwindow1.pandaclist1.row = 0
    w.fixed1.scrolledwindow1.pandaclist1.rowattr = 1
    w.fixed1.pandaentry1.value = "0"
    w.fixed1.pandaentry2.value = "1"
    ROWS.times{|i|
      w.fixed1.scrolledwindow1.pandaclist1.item[i].value0 = i.to_s
    }
    node.put_window("NEW", "clist2")
STDERR.puts "---- START END"
  end

  def do_ROW(node, db)
STDERR.puts "---- do_ROW"
    w = node.windows["clist2"]
    w.fixed1.scrolledwindow1.pandaclist1.row = 
      w.fixed1.pandaentry1.value.to_i
STDERR.puts w.fixed1.scrolledwindow1.pandaclist1.row
    node.put_window("", "clist2")
  end

  def do_ROWATTR(node, db)
STDERR.puts "---- do_ROWATTR"
    w = node.windows["clist2"]
    w.fixed1.scrolledwindow1.pandaclist1.rowattr = 
      w.fixed1.pandaentry2.value.to_i
STDERR.puts w.fixed1.scrolledwindow1.pandaclist1.rowattr
    node.put_window("", "clist2")
  end

end

