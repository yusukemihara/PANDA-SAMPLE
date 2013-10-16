class Address
  def start(node, db)
    hbox = node.windows["address"].vbox1.hbox1
    hbox.id.value = ""
    hbox.name.value = ""
    hbox.mail.value = ""
    clist = node.windows["address"].vbox1.scrolledwindow1.pandaclist1
    clist.item.size.times{|i|
    	clist.item[i].id = ""
    	clist.item[i].name = ""
    	clist.item[i].mail = ""
    }
    select(node, db)
    node.put_window("NEW", "address")
  end

  def do_update(node, db)
    hbox = node.windows["address"].vbox1.hbox1
    insert_or_update(node, db)
    select(node, db)
    hbox.id.value = ""
    hbox.name.value = ""
    hbox.mail.value = ""
    node.put_window
  end

  def do_pgselect(node, db)
    hbox = node.windows["address"].vbox1.hbox1
STDERR.puts hbox.id.value
STDERR.puts hbox.name.value
STDERR.puts hbox.mail.value
    select(node, db)
    node.put_window
  end

  def do_pgupdate(node, db)
    insert_or_update(node, db)
  end

  def do_quit(node,db)
    node.put_window("CLOSE")
  end

  private

  def insert_or_update(node, db)
    hbox = node.windows["address"].vbox1.hbox1
    return if hbox.id.value.to_s.empty?
    args = ["item",
           {"id"   => hbox.id.value.to_i,
            "name" => hbox.name.value,
            "mail" => hbox.mail.value
           }]
    exist_id = false
    db["address"].each("item"){ |dbitem|
      exist_id = true if dbitem.id.to_s == hbox.id.value
    }
    if exist_id
STDERR.puts "update"
      db["address"].update("item",
            "id"   => hbox.id.value,
            "name" => hbox.name.value,
            "mail" => hbox.mail.value)
    else
STDERR.puts "insert"
      db["address"].insert("item",
            "id"   => hbox.id.value,
            "name" => hbox.name.value,
            "mail" => hbox.mail.value)
    end
  end

  def select(node, db)
    clist = node.windows["address"].vbox1.scrolledwindow1.pandaclist1
    clist.count = 0
    clist.row = 0
    db["address"].each("item"){ |dbitem|
      clist.item[clist.count].id   = dbitem.id
      clist.item[clist.count].name = dbitem.name
      clist.item[clist.count].mail = dbitem.mail
      clist.count += 1
    }
  end
end
