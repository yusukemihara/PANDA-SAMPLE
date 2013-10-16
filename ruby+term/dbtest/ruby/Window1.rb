# -*- encoding: UTF-8 -*-
require 'pp'
require 'json'
require 'apshelper'

$KCODE="UTF-8"

# class名はbindのモジュール名=ファイル名と一致する必要がある
class Window1

  # COBOLの手続き部に相当
  # 名前は"exec_process"でないといけない
  # 引数nodeはHashでこれを書き換えることでミドルウェアとやり取りする
  #   node["mcp"]  => MCPAREAをJSONにしたもの
  #   node["link"] => LINKAREAをJSONにしたもの
  #   node["spa"]  => SPAAREAをJSONにしたもの
  #   node["ウィンドウ名"] => 画面定義体をJSONにしたもの
  def exec_process(node)

    # 標準エラー出力にログ表示
    # putsなどでの標準出力ではコンソールに表示されない
    #   -> apsの仕様?
    STDERR.puts "---- Window1"

    # MCPをJSONからHashに変換
    mcp = JSON.parse(node["mcp"])
    # window1をJSONからHashに変換
    w = JSON.parse(node["window1"])  
    w2 = JSON.parse(node["window2"])  
    # LINKやSPAを使う場合は同様にHashに変換する

    next_window = "window1"

    # MCP-STATUSで分岐
    case mcp["dc"]["status"]
    when "LINK"
	when "PUTG"
      # MCP-WIDGETで分岐
      case mcp["dc"]["widget"]
      when "pandaclist1"
        # CLISTから上部エントリに複写
        select_item(w)
      when "button1"
        # 上部エントリのデータをINSERT
        dbfunc("DBINSERT",mcp,w)
      when "button2"
        # 上部エントリのデータをUPDATE
        dbfunc("DBUPDATE",mcp,w)
      when "button3"
        # 上部エントリのデータをDELETE
        dbfunc("DBDELETE",mcp,w)
      when "button5"
        next_window = "window2"
        w2["fixed1"]["pandaentry1"]["value"] = "ウィンドウ1から遷移"
      end
    end

    # SELECTしてCLISTを更新
    update_clist(mcp,w)

    # 次のウィンドウを設定
    mcp["dc"]["window"] = next_window
    mcp["func"] = "PUTWINDOW"
    h_monfunc(mcp,nil)

    # window1のHashをJSONに変換(ミドルウェアに反映)
    node["window1"] = w.to_json
    node["window2"] = w2.to_json
    # MCPのHashをJSONに変換(ミドルウェアに反映)
    node["mcp"] = mcp.to_json
    # LINKやSPAを変更する場合は同様にHashからJSONに変換

  # メソッド内の全ての例外をここで処理
  rescue Exception => ex
    STDERR.puts ex
    STDERR.puts ex.backtrace
  ensure
    STDERR.puts "---- end"
  end

  # テーブル=test,パス=keyのDBINSERT,DBUPDATE,DBDELETEの実行
  def dbfunc(func,mcp,w)
    # スクリーンの上部エントリからDB定義体に複写
    query = {
      "id"    => w["fixed1"]["pandaentry1"]["value"],
      "name"  => w["fixed1"]["pandaentry2"]["value"],
      "price" => w["fixed1"]["numberentry1"]["value"],
    }
    # MCP-FUNCの設定
    mcp["func"] = func
    # MCP-TABLEの設定
    mcp["db"]["table"] = "test"
    # MCP-PATHの設定
    mcp["db"]["pathname"] = "key"
    # MONFUNCの実行
    rc,_mcp,query = h_monfunc(mcp,query)
    # 下部エントリにMCP-RCを表示
    w["fixed1"]["pandaentry3"]["value"] = "#{func} result:#{get_mcprc_str(rc)}"
  end

  # CLIST行選択時にCLIST行から上部エントリに複写
  def select_item(w)
    clist = w["fixed1"]["scrolledwindow1"]["pandaclist1"] 
    item = clist["item"]
    row = clist["select"].index(true)
    if row
      w["fixed1"]["pandaentry1"]["value"] = item[row]["value0"]
      w["fixed1"]["pandaentry2"]["value"] = item[row]["value1"]
      w["fixed1"]["numberentry1"]["value"] = item[row]["value2"]
    end
  end

  # SELECTした結果をCLISTに複写
  def update_clist(mcp,w)
    # DBSELECTの実行
    # DB定義体は不要なのでnilをセット(なんでもいい)
    query = nil
    mcp["func"] = "DBSELECT"
    mcp["db"]["table"] = "test"
    mcp["db"]["pathname"] = "all"
    rc,_mcp,query = h_monfunc(mcp,query)

    clist = w["fixed1"]["scrolledwindow1"]["pandaclist1"] 
    item = clist["item"]
    select = clist["select"]

    # CLISTの行数分DBFETCHを実行
    (item.size).times { |i|
      mcp["func"] = "DBFETCH"
      rc,_mcp,query = h_monfunc(mcp,query)
      if rc == MCP_OK
        # MCP-RCがMCP_OKであればCLISTに複写
        item[i]["value0"] = query["id"]
        item[i]["value1"] = query["name"]
        item[i]["value2"] = query["price"]
        clist["count"] = i + 1
      else
        # MCP-RCがMCP_OKでない場合はループ脱出
        break
      end
    }
  end
end

