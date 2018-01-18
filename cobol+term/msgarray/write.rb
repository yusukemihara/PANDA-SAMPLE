#!/usr/bin/ruby
# coding:utf-8

require 'pp'
require 'uri'
require 'net/http'
require 'json'

Net::HTTP.version_1_2

=begin
msg {
    object          object;
    mode            int;

    data {
        c1      char(128);
        i1      int;
        n1      number(7,3);
        b1      bool;
        a1      int[3];
        r1 {
            r1c1        char(128);
            r2 {
                r2c1    char(128);
            };
        }[3];
    };
};
=end

req = Net::HTTP::Get.new("/test1/test2")
req.basic_auth("sample", "sample")

1.times {
  Net::HTTP.start("localhost", 8000) {|http|
    res = http.request(req)
    puts res.code
    puts res.body
    begin
    pp JSON.parse(res.body)
    rescue Exception
    end
  }
}
