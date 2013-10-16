module Montsuqi

  # libs/wfcio.h
  WFC_NULL   = 0x00
  WFC_DATA   = 0x01
  WFC_PING   = 0x02
  WFC_HEADER = 0x04
  WFC_TERM   = 0x05
  WFC_API    = 0x06

  WFC_FALSE  = 0xE0
  WFC_TRUE   = 0xE1
  WFC_NOT    = 0xF0
  WFC_PONG   = 0xF2
  WFC_NODATA = 0xFC
  WFC_DONE   = 0xFD
  WFC_OK     = 0xFE
  WFC_END    = 0xFF

  WFC_API_OK        = WFC_TRUE
  WFC_API_ERROR     = WFC_FALSE
  WFC_API_NOT_FOUND = WFC_NULL

  # include/glterm.h
  SCREEN_NULL                = 0x00
  SCREEN_CURRENT_WINDOW      = 0x01
  SCREEN_NEW_WINDOW          = 0x02
  SCREEN_CLOSE_WINDOW        = 0x03
  SCREEN_CHANGE_WINDOW       = 0x04
  SCREEN_JOIN_WINDOW         = 0x05
  SCREEN_FORK_WINDOW         = 0x06
  SCREEN_END_SESSION         = 0x07
  SCREEN_BACK_WINDOW         = 0x08
  SCREEN_RETURN_COMPONENT    = 0x09
  SCREEN_CALL_COMPONENT      = 0x10

  SIZE_SIZE_T = 8
  SIZE_INT = 4

  def TermName(ipaddr,port,id)
    term = sprintf("r%s:%d:%d",ipaddr,port,id)
    term
  end

  def send_length(io,l)
    # unsigned long long
    io.syswrite([l].pack("Q"))
  end

  def recv_length(io)
    str = io.sysread(SIZE_SIZE_T)
    str.unpack("Q")[0]
  end

  def send_packet_class(io,c)
    io.syswrite([c].pack("C"))
  end
  
  def recv_packet_class(io)
    str = io.sysread(1)
    str.unpack("C")[0]
  end

  def send_lbs(io,lbs)
    send_string(io,lbs)
  end

  def recv_lbs(io)
    recv_string(io)
  end

  def send_string(io,str)
    if str.nil? || str.empty?
      send_length(io,0)
    else
      send_length(io,str.size)
      io.syswrite(str)
    end
  end

  def recv_string(io)
    size = recv_length(io)
    io.sysread(size)
  end

  def send_int(io,int)
    io.syswrite([l].pack("L!"))
  end

  def recv_int(io)
    str = io.sysread(SIZE_INT)
    str.unpack("I")
    str.unpack("I")[0]
  end

  def send_char(io,c)
    send_packet_class(io,c)
  end

  def recv_char(io)
    recv_packet_class(io)
  end

end
