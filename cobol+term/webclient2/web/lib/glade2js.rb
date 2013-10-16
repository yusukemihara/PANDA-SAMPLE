#!/usr/bin/ruby
# -*- coding: utf-8 -*-
$:.unshift(File.dirname(__FILE__))
require 'pp'
require 'gladeparser'

module Glade2JS

  module_function

  def gen_GtkPandaEntry(widget)
    js = ""
    name = widget.attrs["longname"]
    options = {}
    options["width"] = widget.attrs["width"]  
    options["height"] = widget.attrs["height"] 
    options["text"] = %|"#{widget.attrs["text"]}"|
    options["input_mode"] = %|"#{widget.attrs["input_mode"]}"|
    options["text_max_length"] = widget.attrs["text_max_length"] 
    options["xim_enabled"] = /^f/i =~ widget.attrs["xim_enabled"] ? "true" : "false"
   
    widget.signals.each do |s|
      if s["name"] == "activate"
        options["activate"] = <<-EOS
          function(name) {
            client.send_event(name,"#{s["data"]}");
          }
        EOS
      end
    end

    js << <<-EOS
      var #{name} = $("<input id='#{name}'>")
        .appendTo($(body))
        .GtkPandaEntry()
        .GtkPandaEntry("option",{
          #{gen_options(options)}
        })
        ;
      this.widgets["#{name}"] = #{name};
    EOS
    js
  end

  def gen_GtkLabel(widget)
    js = ""
    name = widget.attrs["longname"]
    options = {}
    options["width"] = widget.attrs["width"]
    options["height"] = widget.attrs["height"] 
    options["label"] = %|"#{widget.attrs["label"]}"| 

    js << <<-EOS
      var #{name} = $("<p id='#{name}'>")
        .appendTo($(body))
        .GtkLabel()
        .GtkLabel("option",{
          #{gen_options(options)}
        })
        ;
      this.widgets["#{name}"] = #{name};
    EOS
    js
  end

  def gen_GtkButton(widget)
    js = ""
    name = widget.attrs["longname"]
    options = {}
    options["width"] = widget.attrs["width"]  
    options["height"] = widget.attrs["height"] 
    options["label"] = %|"#{widget.attrs["label"]}"| 
    widget.signals.each do |s|
      if s["name"] == "clicked"
        case s["handler"]
        when "send_event"
          options["clicked"] = <<-EOS
            function(name) {
              client.send_event(name,"#{s["data"]}");
            }
          EOS
        when "window_destroy"
          options["clicked"] = <<-EOS
            function(name) {
              client.exit();
            }
          EOS
        end
      end
    end

    js << <<-EOS
      var #{name} = $("<button id='#{name}'>")
        .appendTo($(body))
        .GtkButton()
        .GtkButton("option",{
          #{gen_options(options)}
        })
        ;
      this.widgets["#{name}"] = #{name};
    EOS
    js
  end

  # container
  def gen_GtkFixed(widget)
    js = ""
    name = widget.attrs["longname"]
    options = {}
    options["width"] = widget.attrs["width"]  
    options["height"] = widget.attrs["height"] 

    putlist = ""
    widget.children.each do |child|
      js << gen_widget_js(child)
      putlist << <<-EOS
        .GtkFixed("put",#{child.attrs["x"]},#{child.attrs["y"]},#{child.attrs["longname"]})
      EOS
    end

    js << <<-EOS
      var #{name} = $("<div id='#{name}'>")
        .appendTo($(body))
        .GtkFixed()
        .GtkFixed("option",{
          #{gen_options(options)}
        })
        #{putlist}
        ;
      this.widgets["#{name}"] = #{name};
    EOS
    js
  end

  def gen_GtkWindow(widget)
    js = ""
    name = widget.attrs["longname"]
    options = {}
    options["title"] = %|"#{widget.attrs["title"]}"| 
    options["width"] = widget.attrs["width"]
    options["height"] = widget.attrs["height"]
    options["modal"] = /^t/i =~ widget.attrs["modal"] ? "true" : "false"

    cname = "NOWINDOW"
    widget.children.each do |child|
      js << gen_widget_js(child)
      cname = child.attrs["longname"]
    end
    js << <<-EOS
      var #{name} = $("<div id='#{name}'>")
        .GtkWindow()
        .GtkWindow("option",{
          #{gen_options(options)}
        })
        .GtkWindow("put",#{cname})
        ;
      this.widgets["#{name}"] = #{name};
      this.isWindow = #{options["modal"]=="true"?"false":"true"};
    EOS
    js
  end

  def gen_options(options)
    js = ""
    options.each do |k,v|
      next unless v
      js << "     #{k}: #{v},\n"
    end
    js << %|__terminator: ""|
  end

  def gen_widget_js(widget)
    defcode = ""
    defcode << __send__("gen_#{widget.attrs["class"]}",widget)
    defcode
  end

  def gen_js(fname)
    ctx = GladeParser.parse(fname)
    wname = ctx.top_widget.attrs["name"]
    js = <<-EOS
    #{wname}: {
      initialized: false,
      widgets: {},
      widgetData: {},
      initialize: function(body) {
        if (this.initialized) {
          return;
        }
        this.initialized = true;
    EOS
    js << gen_widget_js(ctx.top_widget)
    js << <<-EOS
      },
      show: function() {
        $("##{wname}").GtkWindow("open");
      },
      hide: function() {
        $("##{wname}").GtkWindow("close");
      },
      deserialize: function(data) {
        var w = this;
        this.screenData = data;
        $.each(this.widgets,function(k,v) {
          var d = data;
          var path = k.split("__");
          $.each(path,function(kk,vv) {
            if (!d) {
              return;
            }
            if (d[vv]) {
              d = d[vv];
            } else {
              d = undefined;
            }
          });
          if (d) {
            w.widgetData[k] = d;
            v[v.attr("klass")]("deserialize",d);
          }
        });
      },
      serialize: function() {
        var w = this;
        $.each(this.widgets,function(k,v) {
          if (w.widgetData[k]) {
            v[v.attr("klass")]("serialize",w.widgetData[k]);
          }
        });
        return(this.screenData);
      }
    },
    EOS
    js
  end

end

if $0 == __FILE__
  ARGV.each do |arg|
    puts Glade2JS.gen_js(arg)   
  end
end
