$:.unshift(File.join(File.dirname(__FILE__),"lib"))
require 'sinatra'
require 'haml'
require 'sass'
require 'pp'
require 'yaml'
require 'montsuqi'
require 'glade2js'
require 'json'

enable :sessions

configure do
  @@config = YAML::load(File.read(File.dirname(__FILE__)+'/config.yaml'))
  @@count = 0
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
  if session[:term]
    redirect "/main"
    return
  else
    redirect "/login"
    return
  end
end

get "/login" do
  if session[:term] 
    redirect "/main"
    return
  end
  haml :login
end

post "/login" do
  STDERR.puts "login"
  STDERR.puts params
  STDERR.puts session

  user = params["user"]
  if user == "sample"
    @@count += 1
    term_id = Montsuqi.TermName(request.ip,request.port,@@count)
    term = Montsuqi::WFCSession.new(@@config,user,term_id)
    term.link
    session[:term] = term

    redirect "/main"
  else 
    # フラッシュエラー表示できるとよいが。。。
    redirect "/login"
  end
end

get "/logout" do
  if session[:term]
    session[:term].exit
    session[:term] = nil
  end
  redirect "/login"
end

post "/logout" do
  if session[:term]
    session[:term].exit
    session[:term] = nil
  end
  redirect "/login"
end

get "/favicon.ico" do
  404
end

get "/main" do
  term = session[:term]
  redirect "/login" unless term
  haml :main
end

get "/screendata.json" do 
  redirect "/login" unless session[:term]
  return make_json(session[:term])
end

post "/main" do
  STDERR.puts "---- post"
  request.body.rewind
  json = request.body.read

  term = session[:term]
  redirect "/login" unless term

  STDERR.puts json
  
  data = JSON.parse(json)

  #exit
  if data["exit"]
    session[:term].exit
    session[:term] = nil
    redirect "/login"
    return
  end

  window = data["window"]
  widget = data["widget"]
  event = data["event"]
  rec = Montsuqi.get_window_record(@@config[:recdir],window)
  rec._from_h(data["widget_data"])
  term.main(window,widget,event,rec.native_pack)

  return make_json(term)
end

# filter
before do
  request.path_info = "/login" unless session[:term]
end

# helper
helpers do
  def make_json(term)
    data = {}
    data["window"] = term.this_window
    data["widget"] = term.this_widget
    data["event"] = ""
    rec = Montsuqi.get_window_record(@@config[:recdir],term.this_window)
    rec.native_unpack(term.windows[term.this_window][:lbs])
    data["widget_data"] =  rec._to_h(term.this_window)
    data["window_stack"] = term.window_stack
STDERR.puts data.inspect
    JSON.pretty_generate(data)
  end
end
