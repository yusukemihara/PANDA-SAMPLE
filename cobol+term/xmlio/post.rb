#!/usr/bin/ruby

require 'pp'
require 'uri'
require 'net/http'

Net::HTTP.version_1_1

req = Net::HTTP::Post.new("/xmlio/list")
record_in = <<EOF
  <record>
    <record name="record1">
      <string name="char1">キャラクタ__X__</string>
      <string name="varchar1">バーチャルキャラクタ__X__</string>
      <int    name="int1">__X__</int>
      <number  name="number1">1.__X__</number>
      <bool   name="bool1">true</bool>
      <array  name="array1">
        <int>__X__</int>
        <int>__X__</int>
        <int>__X__</int>
      </array>
    </record>
  </record>
EOF

record = ""
100.times {|i|
  record += record_in.gsub("__X__", i.to_s)
}
BODY = "<data>#{record}</data>"

req.content_length = BODY.size
req.content_type = "application/xml"
req.body = BODY
req.basic_auth("sample", "sample")

Net::HTTP.start("localhost", 8000) {|http|
  res = http.request(req)
  puts res.body
  pp res
}
