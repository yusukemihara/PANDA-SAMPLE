#!/usr/bin/ruby1.8

require 'dbslib'
require 'pp'

dbs = DB_Server.new("localhost",8013,"sample","sample")
rc = dbs.dbops("DBOPEN")
puts "DBOPEN #{rc}"

#insert 1
  rc = dbs.dbops("DBSTART")
  puts "DBSTART #{rc}"
  rec = {}

  rec["test.id"] = 1
  rec["test.name"] = "hoge"
  rec["test.price"] = "100.0"
  
  rc = dbs.recordops("DBINSERT","test","key",rec)
  puts "DBINSERT #{rc}"
  
  rc = dbs.dbops("DBCOMMIT")
  puts "DBCOMMIT #{rc}"

#insert 2
  rc = dbs.dbops("DBSTART")
  puts "DBSTART #{rc}"
  
  rec["test.id"] = 2
  rec["test.name"] = ""
  rec["test.price"] = "100.0"
  
  rc = dbs.recordops("DBINSERT","test","key",rec)
  puts "DBINSERT #{rc}"
  
  rc = dbs.dbops("DBCOMMIT")
  puts "DBCOMMIT #{rc}"

#select
  rc = dbs.dbops("DBSTART")
  puts "DBSTART #{rc}"
  
  rc = dbs.recordops("DBSELECT","test","all")
  puts "DBSELECT #{rc}"
  
#fetch
  while rec = dbs.recordops("DBFETCH","test","all")
    pp rec
  end

rc = dbs.dbops("DBDISCONNECT")
puts "DBDISCONNECT #{rc}"
dbs.close
