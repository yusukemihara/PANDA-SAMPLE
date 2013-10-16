#!/usr/bin/ruby
# -*- coding: utf-8 -*-

class DIParser

  options no_result_var

rule

  system_teigitai
  : teigi1_list_opt
    db_group_list_opt
    teigi2_list_opt
    {
      val[0].merge! val[2]
      val[0][:db_groups] = val[1]
      val[0]
    }

  teigi1_list_opt
  : {{}}
  | teigi1_list

  teigi1_list
  : teigi1             {val[0]}
  | teigi1_list teigi1 {val[0].merge! val[1]}

  teigi1
  : system_mei_teigi              {{:name=>val[0]}}
  | directory_sengen              {{:dirs=>val[0]}}
  | base_sengen                   {{:base=>val[0]}}
  | ddir_sengen                   {{:ddir=>val[0]}}
  | record_sengen                 {{:record=>val[0]}}
  | multiplex_level_sitei         {{:multiplex_level=>val[0]}}
  | gamen_stack_sengen            {{:screen_stack_size=>val[0]}}
  | system_kyotu_ryoiki_sengen    {{:linkage=>val[0]}}
  | wfc_sengen                    {{:wfc=>val[0]}}
  | sysdata_sengen                {{:sysdata=>val[0]}}

  teigi2_list_opt
  :             {{}}
  | teigi2_list {val[0]}


  teigi2_list
  : teigi2             {val[0]}
  | teigi2_list teigi2 {val[0].merge! val[1]}

  teigi2
  : batch_sengen {{:batchs=>val[0]}}
  | ld_sengen    {{:lds=>val[0]}}
    
  system_mei_teigi
  : 'name' NAME ';' 
    {
      val[1]
    }

  base_sengen
  : 'base'   STRING ';' {val[1]}

  ddir_sengen
  : 'ddir'   STRING ';' {val[1]}

  record_sengen
  : 'record'   STRING ';' {val[1]}

  sysdata_sengen
  : 'sysdata' '{' sysdata_teigi_list_opt '}' ';' { val[2] }

  sysdata_teigi_list_opt
  :                    {{}}
  | sysdata_teigi_list {val[0]}

  sysdata_teigi_list
  : sysdata_teigi                    {val[0]}
  | sysdata_teigi_list sysdata_teigi {val[0].merge! val[1]}

  sysdata_teigi
  : 'space' STRING ';' {{:space=>val[1]}}
  | 'port'  STRING ';' {{:port=>val[1]}}

  wfc_sengen
  : 'wfc' '{' wfc_teigi_list_opt  '}'  ';' { val[2] }

  wfc_teigi_list_opt
  :                {{}}
  | wfc_teigi_list {val[0]}

  wfc_teigi_list
  : wfc_teigi                {val[0]}
  | wfc_teigi_list wfc_teigi {val[0].merge! val[1]}

  wfc_teigi
  : 'port' STRING ';' {{:port=>val[1]}}
  | 'term_port' STRING ';' {{:termport=>val[1]}}

  multiplex_level_sitei
  : 'multiplex_level' tajuuka_level ';' { val[1] }

  tajuuka_level
  : 'no'  {val[0]}
  | 'ld'  {val[0]}
  | 'id'  {val[0]}
  | 'aps' {val[0]}

  gamen_stack_sengen
  : 'stacksize' INTEGER ';' { val[1] }

  system_kyotu_ryoiki_sengen
  : 'linkage' NAME ';' { val[1] }

  ld_sengen
  : 'ld' '{' ld_teigi_list_opt '}' ';' { val[2] }

  ld_teigi_list_opt
  :  {[]}
  | ld_teigi_list {val[0]}

  ld_teigi_list 
  : ld_teigi               {val}
  | ld_teigi_list ld_teigi {val[0]<<val[1]}

  ld_teigi
  : NAME aps_kijutu ';' {{:name=>val[0],:launch_opt=>val[1]}}

  aps_kijutu
  : '*' INTEGER {val.join("")}
  | INTEGER     {val[0]}

  batch_sengen
  : 'bd' '{' batch_teigi_list_opt '}' ';' {val[2]}

  batch_teigi_list_opt
  : {[]}
  | batch_teigi_list {val[0]}

  batch_teigi_list
  : batch_teigi                  {val}
  | batch_teigi_list batch_teigi {val[0]<<val[1]}
  
  batch_teigi
  : STRING ';' {val[0]}

  db_group_list_opt
  : {[]}
  | db_group_list

  db_group_list
  : db_group               {[val[2]]}
  | db_group_list db_group {val[0] << val[1]}

  db_group
  : 'db_group' '{' db_group_teigi_list_opt '}' ';' {[val[2]]}

  db_group_teigi_list_opt
  : {{}}
  | db_gourp_teigi_list

  db_gourp_teigi_list
  : db_group_teigi                     {val[0]}
  | db_group_teigi_list db_gourp_teigi {val[0].merge! val[1]}

  db_group_teigi
  : 'type' STRING ';'          {{:type=>val[1]}}
  | 'redirect' STRING ';'      {{:redirect_to=>val[1]}}
  | 'redirect_port' STRING ';' {{:redirect_port=>val[1]}}
  | 'priority' INTEGER ';'     {{:priority=>val[1]}}
  | 'log' INTEGER ';'          {{:log=>val[1]}}
  | 'name' STRING ';'          {{:name=>val[1]}}


end

---- header

  DIReserved = %w|
    { } ; name base ddir wfc port termport
    record multiplex_level no ld id aps stacksize linkage ld db_group *
    sysdata space bd type redirect redirect_port priority log
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
        DIReserved.index(s) ? [s,s] : [:NAME,s]
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
  parser = DIParser.new
  p parser.parse_file(ARGF)
end
