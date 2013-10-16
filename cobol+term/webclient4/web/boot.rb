$:.unshift(File.join(File.dirname(__FILE__),"lib"))
require 'rubygems'
require 'em-websocket'
require 'sinatra/base'
require 'haml'
require 'thin'
require 'pp'
require 'yaml'
require 'yajl'
require 'socket'
require 'erb'

require 'montsuqi'
require 'glade2js'

EventMachine.run do

  @@config = nil

  class App < Sinatra::Base

    enable :sessions

    configure do
      @@config = YAML::load(File.read(File.dirname(__FILE__)+'/config.yaml'))
      Montsuqi.parse_directory(@@config)
      monsia_js =  <<-EOS
      var monsia = {
      EOS
      @@config[:windows].each do |w|
        monsia_js << Glade2JS.gen_js(File.join(@@config[:screendir],"#{w}.glade"))
      end
      monsia_js << <<-EOS
      __terminator: ""
      };
      EOS
      monsia_js.gsub!(/^\s+/,"")
      File.open("public/js/monsia.js","w") do |io|
       io.puts monsia_js
      end
    end

    get '/' do
      haml :index
    end
  end

  class SessionWorker
    include EM::Deferrable
  
    def initialize(ipaddr,port,count)
      @term_id = Montsuqi.TermName(ipaddr,port,count)
      @term = nil
    end

    def auth(user,pass)
      user == "sample"
    end

    def login(user,pass)
      if auth(user,pass)
        @term = Montsuqi::WFCSession.new(@@config,user,@term_id)
        @term.link
        return make_response
      end
      return nil
    end

    def main(data)
      if data["exit"]
        @term.exit
        @term = nil
        return {"status" => 205}
      end

      window = data["window"]
      widget = data["widget"]
      event = data["event"]
      rec = Montsuqi.get_window_record(@@config[:recdir],window)
      rec.from_h(data["widget_data"])
      @term.main(window,widget,event,rec.native_pack)
      return make_response
    end

    def logout
      @term.exit if @term
      @term = nil
    end

    def make_response
      data = {}
      data["status"] = 200
      data["window"] = @term.this_window
      data["widget"] = @term.this_widget
      data["event"] = ""
      rec = Montsuqi.get_window_record(@@config[:recdir],@term.this_window)
      rec.native_unpack(@term.windows[@term.this_window][:lbs])
      data["widget_data"] =  rec.to_h
      data["window_stack"] = @term.window_stack
      return data
    end

  end

  @count = 0

  EventMachine::WebSocket.start(:host => '0.0.0.0', :port => 8080) do |ws|
    ws.onopen {

      port,ipaddr = Socket.unpack_sockaddr_in(ws.get_peername)
      count = @count
      worker = SessionWorker.new(ipaddr,port,count)

      @count += 1

      ws.onmessage { |msg|
        data = Yajl::Parser.parse(msg)
        case data["type"]
        when "login" 
          res = worker.login(data["user"],data["password"])
          if res
            ws.send Yajl::Encoder.encode(res)
          else
            ws.send Yajl::Encoder.encode({"status"=>403})
          end
        when "main"
          res = worker.main(data)
          if res
            ws.send Yajl::Encoder.encode(res)
          else
            ws.send Yajl::Encoder.encode({"status"=>500})
          end
        end
      }

      ws.onclose {
        worker.logout
        puts "onclose"
      }
      
      ws.onerror { |e|
        worker.logout
        puts "Error: #{e.message}"
        puts e.backtrace
      }
    }
  end

  App.run!({:port => 3000})
end
