#!/usr/bin/ruby
# coding:utf-8

require 'pp'
require 'uri'
require 'net/http'

Net::HTTP.version_1_2

=begin
msg {
	data {
		c1		char(128);
		vr1		varchar(128);
		i1		int;
		n1		number(15,10);
		b1		bool;
		a1		int[3];
 		ra1 {
			ra1c1		char(128);
			ra1c2		char(128);
			ra1c3		char(128);
			ra2 {
				ra2c1	char(128);
				ra2c2	char(128);
			};
		}[3];
	};
};
=end

req = Net::HTTP::Post.new("/msgio/api1")
record_in = <<EOF
{
  "data":{
    "c1":"不正なコンテントタイプ"
  }
}
EOF

req.content_length = record_in.size
req.content_type = "application/xml"
req.body = record_in
req.basic_auth("sample", "sample")

1.times {
  Net::HTTP.start("localhost", 8000) {|http|
    res = http.request(req)
    puts res.code
    puts res.body
  }
}
