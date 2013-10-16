#!/usr/bin/ruby

require 'uri'
require 'net/http'

Net::HTTP.version_1_1

#req = Net::HTTP::Get.new("/windowtitle/action02?reqid=#{URI.encode('キー')}&reqval02=#{URI.encode('バリュー')}")
#req = Net::HTTP::Get.new("/windowtitle/action01?reqval01=#{URI.encode('キー')}")
req = Net::HTTP::Post.new("/windowtitle/post?reqval01=hoge")
#BODY = "<data>hoge</data>"
BODY = 'a' *  (1024 * 1024 - 1)  # almost 1Mbyte

req.content_length = BODY.size
req.content_type = "application/xml"
req.body = BODY
req.basic_auth("sample", "sample")

Net::HTTP.start("localhost", 8000) {|http|
  res = http.request(req)
  puts res.body
  puts res.body.size
#  puts res["content-length"]
}
