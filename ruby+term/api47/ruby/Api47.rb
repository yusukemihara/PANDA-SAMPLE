class Api47

  def start(node, db)
STDERR.puts RUBY_VERSION
STDERR.puts "---- start"
    window = node.windows["api47"]
    arg = window["argument"]
    window["body"] = 0
    if window["methodtype"] == "GET"
      window["httpstatus"] = arg["reqstatus"]
      File.open("body.txt","w") { |io|
        io.print <<-EOF
        this is body.
        EOF
      }
      if window["httpstatus"] == 200
        item = db["work"].blob_import(nil, "file" => "body.txt")
        window["body"] = db["work"].object
      end
    else
      window["httpstatus"] = 400
    end
  end

  def do_(node, db)
  end
end

