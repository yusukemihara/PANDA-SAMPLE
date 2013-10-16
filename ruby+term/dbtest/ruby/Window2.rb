# -*- encoding: UTF-8 -*-
require 'pp'
require 'json'
require 'apshelper'

$KCODE="UTF-8"

class Window2

  def exec_process(node)

    STDERR.puts "---- Window2"

    mcp = JSON.parse(node["mcp"])
    w1 = JSON.parse(node["window1"])  
    w2 = JSON.parse(node["window2"])  

    next_window = "window2"

    # MCP-STATUSで分岐
    case mcp["dc"]["status"]
    when "LINK"
	when "PUTG"
      # MCP-WIDGETで分岐
      case mcp["dc"]["widget"]
      when "button1"
        w1["fixed1"]["pandaentry3"]["value"] = "ウィンドウ2から遷移"
        next_window = "window1"
      end
    end

    mcp["dc"]["window"] = next_window
    mcp["func"] = "PUTWINDOW"
    h_monfunc(mcp,nil)

    node["window1"] = w1.to_json
    node["mcp"] = mcp.to_json

  # メソッド内の全ての例外をここで処理
  rescue Exception => ex
    STDERR.puts ex
    STDERR.puts ex.backtrace
  ensure
    STDERR.puts "---- end"
  end

end

