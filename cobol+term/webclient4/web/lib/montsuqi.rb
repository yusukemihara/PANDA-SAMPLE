$:.unshift(File.dirname(__FILE__))
require 'DIparser.tab'
require 'LDparser.tab'
require 'protocol'
require 'rubymondai'

require 'socket'
require 'pp'
require 'yaml'

module Montsuqi

  class WFCSession

    include Montsuqi

    attr_accessor :term_id,:windows,:this_window,:user,:this_widget,:window_stack

    def initialize(conf,user,term_id)
      @conf = conf
      @term_id = term_id
      @user = user
      @windows = {}
      @window_stack = []
    end

    def link
      io = connect
      regist_term(io)
      recv(io)
      io.close
    end

    def main(window,widget,event,data)
      io = connect
      send(io,window,widget,event,data)
      recv(io)
      io.close
    end

    def exit
      io = connect
      send_end(io)
      io.close
    end

    private

    def connect
      io = nil
      wfcport = @conf[:directory][:wfc][:termport]
      wfcport ||= "/tmp/wfc.term"
      case wfcport
      when %r|\A/| # => unix domain socket
        io = UNIXSocket.open(wfcport)
      when %r|\A([\w\.]*):(\d+)|
        host = $1.empty? ? "localhost" : $1
        port = $2.to_i
        io = TCPSocket.open(host,port)
      else
        host = wfcport
        port = 9001
        io = TCPSocket.open(host,port)
      end
      io
    end

    def regist_term(io)
      send_packet_class(io,WFC_TERM)
      send_string(io,@term_id)
      send_packet_class(io,WFC_TRUE) # fKeep = True
      send_string(io,@user)
      send_string(io,@conf[:initld]) # @init_ld = orca00
      case recv_packet_class(io)
      when WFC_OK
        # do noting
      else
        io.close
        raise "500 internal"
      end
      send_packet_class(io,WFC_OK)
    end

    def recv(io)
      # PING PONG
      recv_packet_class(io)
      send_packet_class(io,WFC_PONG)

      # recv term HEADER
      @windows.each do |wname,val|
        val[:puttype] = SCREEN_NULL
      end
      recv_packet_class(io) # WFC_HEADER
      user = recv_string(io)
      window = recv_string(io)
      widget = recv_string(io)
      puttype = recv_char(io)
      @windows[window] ||= {}

      n = recv_int(io)             
      n.times do                    
        _puttype = recv_int(io)
        _window = recv_string(io)   
        @windows[_window] ||= {}
        if _puttype == SCREEN_CLOSE_WINDOW 
          @windows[_window][:puttype] = _puttype
          @window_stack.delete(_window)
        else
          @windows[_window][:puttype] = SCREEN_NULL
        end
      end                           

      case puttype
      when SCREEN_CHANGE_WINDOW
        if @this_window
          @windows[@this_window][:puttype] = SCREEN_CLOSE_WINDOW
          @window_stack.delete(_window)
        end
        puttype = SCREEN_NEW_WINDOW
      when SCREEN_JOIN_WINDOW
        puttype = SCREEN_CURRENT_WINDOW
      end
      @windows[window] = {:puttype => puttype}
      @window_stack.delete(window)
      @window_stack.push(window)
      @window_stack.reverse!

      # recv term data
      @windows.each do |wname,val|
        if val[:puttype] == SCREEN_CURRENT_WINDOW || 
           val[:puttype] == SCREEN_NEW_WINDOW 
          send_packet_class(io,WFC_DATA)
          send_string(io,wname)
          case recv_packet_class(io)
          when WFC_OK
            val[:lbs] = recv_lbs(io)
          end
        end
      end
      send_packet_class(io,WFC_DONE)
      recv_packet_class(io) # WFC_DONE
      @this_window = window
      @this_widget = widget
    end

    def send(io,window,widget,event,data)
      ret = FALSE
      send_packet_class(io,WFC_TERM)
      send_string(io,@term_id)
      if recv_packet_class(io) == WFC_TRUE
        send_packet_class(io,WFC_DATA)
        send_string(io,window)
        send_string(io,widget)
        send_string(io,event)
        if recv_packet_class(io)  == WFC_OK
          if data
            send_packet_class(io,WFC_DATA)
            send_lbs(io,data)
          else 
            send_packet_class(io,WFC_NODATA)
          end
          send_packet_class(io,WFC_OK)
          ret = TRUE
        end
      end
      ret
    end

    def send_end(io)
      send_packet_class(io,WFC_TERM)
      send_string(io,@term_id)
      if recv_packet_class(io) == WFC_TRUE
        send_packet_class(io,WFC_END)
        recv_packet_class(io) # WFC_DONE
      end
    end
  end

  def parse_directory(conf)
    diparser = DIParser.new
    di = diparser.parse_file(File.open(conf[:directory]))
  
    windows = []
    api = {}
    conf[:ddir] = di[:ddir].sub(/=/,di[:base])
    conf[:recdir] = di[:record].sub(/=/,di[:base])
    ldparser = LDParser.new
    di[:lds].each do |ld|
      ldfile = File.join(conf[:ddir],"#{ld[:name]}.ld")
      ld = ldparser.parse_file(File.open(ldfile))
      ld[:dc][:window].each do |w|
        windows << w
      end
    end
  
    conf[:windows] = windows
    conf[:directory] = di
    conf
  end

  def get_window_record(recdir,name)
    recfile = File.join(recdir,"#{name}.rec")
    rec = Rubymondai::RecordValue.new(File.read(recfile))
    return rec
  end

  module_function(*instance_methods(false))

end

if $0 == __FILE__
  conf = Montsuqi.parse_directory({:directory=>"../../directory",:initld=>"weborca"})
  session = Montsuqi::WFCSession.new(conf,"sample",Montsuqi.TermName("127.0.0.1",9000,rand(100)))
  session.link
#  session.windows["window1"][:rec]["fixed1.pandaentry1.entrydata1"] = "huga---!!!"
#  session.main("window1","button1","clicked",session.windows["window1"][:rec].native_pack)
  session.exit
end
