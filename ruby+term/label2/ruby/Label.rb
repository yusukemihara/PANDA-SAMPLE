# -*- encoding: UTF-8 -*-
require 'pp'
require 'json'

class Label
  def main(node)
STDERR.puts "----main"
#STDERR.puts node
    mcp = JSON.parse(node["mcp"])
    status = mcp["dc"]["status"]
STDERR.puts status
    w = JSON.parse(node["labeltest"])  

    case status
    when "LINK"
      w["fixed1"]["label1"]["ltext"] = "gununu"
      w["fixed1"]["pandaentry1"]["etext"] = "nn-?"
      w["fixed1"]["pandaentry1"]["editable"] = true
    else
      w["fixed1"]["label1"]["ltext"] = w["fixed1"]["pandaentry1"]["etext"]
      #w["fixed1"]["label1"]["ltext"] = %!<span color="blue">rose</span> is not exist!
      w["fixed1"]["pandaentry1"]["etext"] = ""
    end
    node["labeltest"] = w.to_json

    mcp["dc"]["window"] = "labeltest"
    mcp["func"] = "PUTWINDOW"
    node["mcp"] = mcp.to_json
    MONFUNC(node["mcp"],"")
STDERR.puts "----main end"
  end
end

