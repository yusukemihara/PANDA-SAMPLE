# -*- encoding: UTF-8 -*-
require 'pp'
require 'json'
require 'yaml'
require 'apshelper'

$KCODE="UTF-8"

#実行例
# % dbstub -bd batch BATCHALL

class BATCHALL
  def start_batch(param)

    STDERR.puts "---- begin BATCHALL"

    query = nil
    mcp = {"db" => {}}

    # DBOPEN
    mcp["func"] = "DBOPEN"
    rc,mcpry = h_monfunc(mcp,nil)
    mcp["func"] = "DBSTART"
    rc,mcp,query = h_monfunc(mcp,nil)

    # DBSELECTの実行
    mcp["func"] = "DBSELECT"
    mcp["db"]["table"] = "test"
    mcp["db"]["pathname"] = "all"
    rc,mcp = h_monfunc(mcp,nil)

    loop {
      mcp["func"] = "DBFETCH"
      rc,mcp,query = h_monfunc(mcp,nil)
      puts "----"
      pp query
      break unless rc == MCP_OK
    }

    mcp["func"] = "DBCLOSECURSOR"
    rc,mcp = h_monfunc(mcp,nil)
    mcp["func"] = "DBCOMMIT"
    rc,mcp = h_monfunc(mcp,nil)
    mcp["func"] = "DBDISCONNECT"
    rc,mcp = h_monfunc(mcp,nil)


  rescue Exception => ex
    STDERR.puts ex
    STDERR.puts ex.backtrace
  ensure
    STDERR.puts "---- end BATCHALL"
  end

end

