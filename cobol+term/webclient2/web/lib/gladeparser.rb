#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'rexml/document'
require 'rexml/streamlistener'
require 'nkf'
require 'pp'

module GladeParser

  class WidgetInfo
    attr_accessor :children,:signals,:attrs,:accels,:parent

    def initialize
      @children = []
      @signals = []
      @accels = []
      @attrs = {}
    end
  end

  class GladeListener
    include REXML::StreamListener
  
    attr_accessor :top_widget
  
    def initialize
      @cur_state = :START
      @widget_depth = 0
      @unknown_depth = 0
    end

    def tag_start(name,attrs)
      @have_content = false
      case @cur_state
      when :START
        @cur_state = :INTERFACE
      when :INTERFACE
        case name
        when "widget"
          @cur_state = :WIDGET
          @cur_widget = WidgetInfo.new
          @top_widget = @cur_widget unless @top_widget
          @widget_depth += 1
        else
          @prev_state = @cur_state
          @cur_state = :UNKNOWN
          @unknown_depth += 1
        end
      when :WIDGET
        case name
        when "accelerator"
          @cur_state = :ACCEL
          @cur_accel = {}
        when "signal"
          @cur_state = :SIGNAL
          @cur_signal = {}
        when "child"
          @cur_state = :CHILD
        when "widget"
          info = WidgetInfo.new
          @cur_widget.children << info
          info.parent = @cur_widget
          @cur_widget = info
          @widget_depth += 1
        else
          @cur_state = :WIDGET_ATTR
        end
      when :WIDGET_ATTR,:CHILD_ATTR,:SIGNAL_ATTR,:ACCEL_ATTR
        @prev_state = @cur_state
        @cur_state = :UNKNOWN
        @unknown_depth += 1
      when :CHILD
        @cur_state = :CHILD_ATTR
      when :SIGNAL
        @cur_state = :SIGNAL_ATTR
      when :ACCEL
        @cur_state = :ACCEL_ATTR
      when :UNKNOWN
        @unknown_depth += 1
      else
        #unknown
      end
    end

    def get_longname(winfo)
      lname = winfo.attrs["name"]
      info = winfo.parent
      while(!info.nil?)
        lname = "#{info.attrs["name"]}__#{lname}"
        info = info.parent
      end
      lname
    end
  
    def tag_end(name)
      @content = "" unless @have_content
      case @cur_state
      when :UNKNOWN
        @unknown_depth -= 1
        if @unknown_depth == 0
          @cur_state = @prev_state
        end
      when :WIDGET_ATTR
        @cur_state = :WIDGET
        @cur_widget.attrs[name] = @content
      when :CHILD_ATTR
        @cur_state = :CHILD
        @cur_widget.attrs[name] = @content
      when :CHILD
        @cur_state = :WIDGET
      when :WIDGET
        longname = get_longname(@cur_widget)
        @cur_widget.attrs["longname"] = longname
        @cur_widget = @cur_widget.parent
        unless @cur_widget
          @cur_state = :INTERFACE
        end
      when :SIGNAL_ATTR
        @cur_state = :SIGNAL
        @cur_signal[name] = @content
      when :SIGNAL    
        @cur_state = :WIDGET
        @cur_widget.signals << @cur_signal
      when :ACCEL_ATTR
        @cur_state = :ACCEL
        @cur_accel[name] = @content
      when :ACCEL    
        @cur_state = :WIDGET
        @cur_widget.accels << @cur_accel
      when :INTERFACE
        @cur_state = :FINISH
      else
        puts "not reached"
      end
    end

    def text(content)
      @have_content = true
      @content = content
    end
  end

  module_function

  def parse(fname)
    listener = GladeListener.new
    rawsource = File.read(fname)
    if RUBY_VERSION < "1.9"
      source = NKF::nkf('-Ewm0',rawsource)
    else
      source = rawsource.encode("UTF-8","EUC-JP")
    end
    REXML::Document.parse_stream(source,listener)
    listener
  end

end

if $0 == __FILE__
  ARGV.each do |arg|
    pp GladeParser.parse(arg)   
  end
end
