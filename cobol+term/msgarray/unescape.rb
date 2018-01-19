#!/usr/bin/ruby
# coding:utf-8

require 'pp'
require 'uri'
require 'net/http'

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

req = Net::HTTP::Post.new("/test1/test3")
body = <<EOF
[
  {
    "c1":"{\\"hoge\\":
\\"moge\\",\\"gg\\":[1,2,3]}",
    "i1":1,
    "n1": 10.999,
    "b1": true,
    "a1": [1,2,3], 
    "r1": [
      {
        "r1c1":"r1c1",
        "r2":{"r2c1":"r2c1"}
      },
      {
        "r1c1":"r1c1",
        "r2":{"r2c1":"r2c1"}
      },
      {
        "r1c1":"r1c1",
        "r2":{"r2c1":"r2c1"}
      }
    ]
  }
]
EOF

#body = <<EOF
#[
#  {
#    "c1":"c1",
#    "i1":1,
#    "n1": 10.999,
#    "b1": true,
#    "a1": [1,2,3], 
#    "r1": [
#      {
#        "r1c1":"r1c1",
#        "r2":{"r2c1":"r2c1"}
#      },
#      {
#        "r1c1":"r1c1",
#        "r2":{"r2c1":"r2c1"}
#      },
#      {
#        "r1c1":"r1c1",
#        "r2":{"r2c1":"r2c1"}
#      }
#    ]
#  }
#]
#EOF

req.content_type = "application/json"
req.body = body
req.content_length = body.size
req.basic_auth("sample", "sample")

1.times {
  Net::HTTP.start("localhost", 8000) {|http|
    res = http.request(req)
    puts res.code
    puts res.body
  }
}
