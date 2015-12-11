#!/usr/bin/ruby
# coding:utf-8

require 'pp'
require 'uri'
require 'net/http'

Net::HTTP.version_1_2

=begin
xml2 {
    context		int;
    object		object;
	mode		int;
    recordname	varchar(128);

	head {
		meta	char(128);
		version	int;
	};

	body {
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
			}[3];
		}[3];
	};
};
=end

req = Net::HTTP::Post.new("/xmlio2/xmlio2")
record_in = <<EOF
{
  "body":{
    "c1":"しーいち",
    "vc1":"ぶいしーいち",
    "i1":100,
    "n1":3.14159265353892,
    "b1":true,
    "a1":[0,1,2],
    "ra1": [
      {
        "ra1c1":"１",
        "ra1c2":"１",
        "ra1c3":"１",
        "ra2": [
          {
            "ra2c1":"１ー１",
            "ra2c2":"１ー１"
          },
          {
            "ra2c1":"１ー２",
            "ra2c2":"１ー２"
          },
          {
            "ra2c1":"１ー３",
            "ra2c2":"１ー３"
          }
        ]
      },
      {
        "ra1c1":"２",
        "ra1c2":"２",
        "ra1c3":"２",
        "ra2": [
          {
            "ra2c1":"２１ー１",
            "ra2c2":"２１ー１"
          },
          {
            "ra2c1":"２１ー２",
            "ra2c2":"２１ー２"
          },
          {
            "ra2c1":"２１ー３",
            "ra2c2":"２１ー３"
          }
        ]
      },
      {
        "ra1c1":"３１",
        "ra1c2":"３１",
        "ra1c3":"３１",
        "ra2": [
          {
            "ra2c1":"３１ー１",
            "ra2c2":"３１ー１"
          },
          {
            "ra2c1":"３１ー２",
            "ra2c2":"３１ー２"
          },
          {
            "ra2c1":"３１ー３",
            "ra2c2":"３１ー３"
          }
        ]
      }
    ]
  }
}
EOF

req.content_length = record_in.size
req.content_type = "application/json"
req.body = record_in
req.basic_auth("sample", "sample")

1.times {
  Net::HTTP.start("localhost", 8000) {|http|
    res = http.request(req)
    puts res.code
    puts res.body
  }
}
