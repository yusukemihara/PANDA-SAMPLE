#!/usr/bin/ruby

require 'uri'
require 'pp'
require 'net/http'

Net::HTTP.version_1_1

req = Net::HTTP::Get.new("/api47/api47?reqstatus=501")
req.basic_auth("sample", "sample")

Net::HTTP.start("localhost", 8000) {|http|
  res = http.request(req)
  puts res.body
  pp res
}
