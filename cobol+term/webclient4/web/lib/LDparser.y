#!/usr/bin/ruby
# -*- coding: utf-8 -*-

class LDParser

  options no_result_var

rule
  ld_def
  : topdef          {val[0]}
  | ld_def topdef 
    {
      type = val[1][:type]
      if type && val[0][type]
        val[0][type] << val[1][type]
        val[0][type].flatten!
      else
        val[0].merge! val[1]
      end
      val[0]
    }

  topdef
  : ld_name                {{:name=>val[0]}}
  | multiplex_group        {{:multiplex=>val[0]}}
  | cache_num              {{:cache_num=>val[0]}}
  | arraysize              {{:arraysize=>val[0]}}
  | textsize               {{:textsize=>val[0]}}
  | homedir                {{:homedir=>val[0]}}
  | dc                     {{:dc=>val[0]}}
  | bind                   {{:binds=>[val[0]],:type=>:binds}}
  | bindapi                {{:bindapis=>[val[0]],:type=>:bindapis}}
  | handler                {{:handlers=>[val[0]],:type=>:handlers}}
  | dbg_decl               {{:dbgs=>[val[0]],:type=>:dbgs}}

  ld_name
  : 'name' NAME ';' {val[1]}

  handler
  : 'handler' NAME '{' handler_def_list '}' ';' 
  {val[3][:name] = val[1]
   val[3]
  }

  handler_def_list
  : handler_def                   {val[0]}
  | handler_def_list handler_def  {val[0].merge! val[1]}

  handler_def
  : 'class' name_or_string ';'        {{:class=>val[1]}}
  | 'serialize' name_or_string ';'    {{:serialize=>val[1]}}
  | 'start' STRING ';'                {{:start=>val[1]}}
  | 'coding' name_or_string ';'       {{:coding=>val[1]}}
  | 'endcoding' name_or_string ';'    {{:encoding=>val[1]}}
  | 'loadpath' STRING ';'             {{:loadpath=>val[1]}}

  name_or_string
  : STRING {val[0]}
  | NAME   {val[0]}

  multiplex_group
  : 'multiplex_group' NAME ';' {val[1]}

  bind
  : 'bind' STRING STRING STRING ';' {{:window=>val[1],:handler=>val[2],:module=>val[3]}}

  bindapi
  : 'bindapi' STRING STRING STRING ';' {{:window=>val[1],:handler=>val[2],:module=>val[3]}}


  homedir
  : 'home' STRING ';' {val[1]}

  arraysize
  : 'arraysize' INTEGER ';' {val[1]}

  textsize
  : 'textsize' INTEGER ';' {val[1]}

  cache_num
  : 'cache' INTEGER ';' {val[1]}

  dc 
  : 'data' '{' spa_window_list_opt '}' ';' {val[2]}

  spa_window_list_opt
  :                 {{}}
  | spa_window_list {val[0]}

  spa_window_list
  : spa_window                 {val[0]}
  | spa_window_list spa_window {val[0].merge! val[1]}

  spa_window
  : 'spa' NAME ';' {{:spa=>val[1]}}
  | 'window' '{' window_list '}' ';' {{:window=>val[2]}}

  window_list
  : window             {val}
  | window_list window {val[0] << val[1]}

  window
  : NAME ';' {val[0]}

  dbg_decl
  : 'db' STRING '{' db_list_opt '}' ';' {{:name=>val[1],:db_list=>val[3]}}

  db_list_opt
  :          {[]}
  | db_list  {val[0]}

  db_list
  : db         {val}
  | db_list db {val[0] << val[1]}

  db
  : NAME ';' {val[0]}
end

---- header

  Reserved = %w|
    { } ; name handler class serialize start coding encoding loadpath
    multiplex_group bind home arraysize textsize cache data spa window
    db
  |

---- inner

  def initialize
    @yydebug = true
  end

  def parse_file(f)
    @f = f
    @line_no = 0
    @line = ""
    do_parse
  end

  def next_token
    loop do
      @line = fetch_line(@line)
      unless @line
        return [false, :END_OF_FILE]
      end

      token = case @line
      when /\A\s+/
        nil
      when /\A\d+/
        [:INTEGER,$&.to_i]
      when %r!\A"(.*?)"!
        s = $1
        [:STRING,s]
      when %r!\A\w+!
        s = $&
        Reserved.index(s) ? [s,s] : [:NAME,s]
      when /\A./
        s=$&
        [s,s]
      end
      
      @line = $'
      return token if token
    end
  end

  def on_error(t,val,vstack)
    raise ParseError, "\nunexpected token #{t} #{val.inspect} #{vstack}"
  end

  def fetch_line(line)
    if line.empty?
      line=@f.gets
      @line_no += 1 if line
    end
    line
  end

---- footer

if $0 == __FILE__
  parser = LDParser.new
  p parser.parse_file(ARGF)
end
