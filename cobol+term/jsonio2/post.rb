#!/usr/bin/ruby

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

req = Net::HTTP::Post.new("/jsonio/jsonio")
record_in = <<EOF
{
"c1":"__c1__",
"msg":"msg",
"vc1":"__vc1__"
}
EOF

req.content_length = record_in.size
req.content_type = "application/xml"
req.body = record_in
req.basic_auth("sample", "sample")

1000.times do |i|

Net::HTTP.start("localhost", 8000) {|http|
  req.body = record_in.sub('__c1__',i.to_s).sub('__vc1__',i.to_s)
  res = http.request(req)
  puts res.body
  pp res
}
end
