# -*- encoding: UTF-8 -*-
require 'pp'
require 'json'
require 'yaml'
require 'apshelper'

$KCODE = "UTF-8"

# 実行例
# % dbstub -bd batch -parameter "{func: DBINSERT, id: 100, name: まげげ, price: 99.00}" BATCHKEY
# % dbstub -bd batch -parameter "{func: DBUPDATE, id: 100, name: まげげ, price: 99.00}" BATCHKEY
# % dbstub -bd batch -parameter "{func: DBDELETE, id: 100, name: まげげ, price: 99.00}" BATCHKEY

class BATCHKEY
  def start_batch(param)

    STDERR.puts "---- begin BATCHKEY"

    mcp = {}
    query = YAML.load(param)

    # DBOPEN
    mcp["func"] = "DBOPEN"
    rc,mcp = h_monfunc(mcp,nil)
    mcp["func"] = "DBSTART"
    rc,mcp = h_monfunc(mcp,nil)

    # funcの実行
    mcp["func"] = query["func"]
    mcp["db"]["table"] = "test"
    mcp["db"]["pathname"] = "key"
    rc,mcp,query = h_monfunc(mcp,query)
    puts get_mcprc_str(rc)

    mcp["func"] = "DBCOMMIT"
    rc,mcp = h_monfunc(mcp,nil)
    mcp["func"] = "DBDISCONNECT"
    rc,mcp = h_monfunc(mcp,nil)
  rescue Exception => ex
    STDERR.puts ex
    STDERR.puts ex.backtrace
  ensure
    STDERR.puts "---- end BATCHKEY"
  end

end

