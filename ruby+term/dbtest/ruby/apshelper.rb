# -*- encoding: UTF-8 -*-
require 'pp'
require 'json'

$KCODE="UTF-8"

# MONFUNCのラッパ
# 引数_mcp,_dataはHash形式
# MCP-RC,MCPのHash形式、DB定義体のHash形式を返す
def h_monfunc(_mcp,_data)
  # MONFUNCの引数はJSON形式なので変換する
  rc,mcp,data = monfunc(_mcp.to_json,_data.to_json)
  mcp = JSON.parse(mcp)  unless mcp.nil?
  data = JSON.parse(data) unless data.nil?
  return rc,mcp,data
end

# MCP-RCの文字列化
def get_mcprc_str(rc)
  case rc
  when MCP_OK
    return "MCP_OK"
  when MCP_EOF
    return "MCP_EOF"
  when MCP_NONFATAL
    return "MCP_NONFATAL"
  when MCP_BAD_ARG
    return "MCP_BAD_ARG"
  when MCP_BAD_OTHER
    return "MCP_BAD_OTHER"
  when MCP_BAD_CONN
    return "MCP_BAD_CONN"
  else
    return "MCP_UNKNOWN"
  end
end
