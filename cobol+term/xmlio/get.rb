#!/usr/bin/ruby

require 'uri'
require 'pp'
require 'net/http'

Net::HTTP.version_1_1

req = Net::HTTP::Get.new("/xmlio/list?max=10")
req.basic_auth("sample", "sample")

Net::HTTP.start("localhost", 8000) {|http|
  res = http.request(req)
  puts res.body
  pp res
}
