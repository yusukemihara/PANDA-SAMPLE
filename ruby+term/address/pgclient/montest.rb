require	'monlib';

#
# select rows
#
server = PG_Server.new("localhost",0,"panda:address","sample","sample");
server.setValue("address.vbox1.hbox1.id.value","0")
ev = server.event("pgselect");
printf("ev[0] = [%s]\n",ev[0]);
printf("ev[1] = [%s]\n",ev[1]);

clist = "address.vbox1.scrolledwindow1.pandaclist1"
count = server.getValue(clist + ".count").to_i
idlist = []
count.times{ |i|
  id = server.getValue(sprintf("%s.item[%d].id",clist,i))
  name = server.getValue(sprintf("%s.item[%d].name",clist,i))
  mail = server.getValue(sprintf("%s.item[%d].mail",clist,i))
  idlist.push(id.to_i)
  puts "id:#{id} name:#{name} mail:#{mail}"
}
server.close

id = 0
loop {
  break unless idlist.include?(id)
  id += 1
}
puts id 

#
# insert row
#
server = PG_Server.new("localhost",0,"panda:address","sample","sample");
hbox = "address.vbox1.hbox1"
server.setValue(hbox + ".id.value", id.to_s)
server.setValue(hbox + ".name.value", "user#{id}")
server.setValue(hbox + ".mail.value", "user#{id}@user.com")
ev = server.event("pgupdate");
printf("ev[0] = [%s]\n",ev[0]);
printf("ev[1] = [%s]\n",ev[1]);

server.close
exit 0
