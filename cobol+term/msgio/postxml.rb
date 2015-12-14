#!/usr/bin/ruby

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
<?xml version="1.0" encoding="UTF-8"?>
<xmlio2>
  <data type="record">
    <c1 type="string">c1</c1>
    <vc1 type="string">vc1</vc1>
    <i1 type="int">1</i1>
    <n1 type="number">3.14159265</n1>
    <b1 type="bool">TRUE</b1>
    <a1 type="array">
      <a1_child type="int">0</a1_child>
      <a1_child type="int">1</a1_child>
      <a1_child type="int">2</a1_child>
    </a1>
    <ra1 type="array">
      <!-- 0 -->
      <ra1_child type="record">
        <ra1c1 type="string">ra1c1 0</ra1c1>
        <ra1c2 type="string">ra1c2 0</ra1c2>
        <ra1c3 type="string">ra1c3 0</ra1c3>
        <ra2 type="record">
            <ra2c1 type="string">aa</ra2c1>
            <ra2c2 type="string">bb</ra2c2>
        </ra2>
      </ra1_child>
      <!-- 1 --> <!-- partial empty -->
      <ra1_child type="record">
        <ra1c1 type="string">ra1c1 1</ra1c1>
        <ra1c2 type="string">ra1c2 1</ra1c2>
        <ra1c3 type="string">ra1c3 1</ra1c3>
        <ra2 type="record">
            <ra2c1 type="string">aa1</ra2c1>
            <ra2c2 type="string">bb1</ra2c2>
        </ra2>
      </ra1_child>
      <ra1_child type="record">
        <ra1c1 type="string">ra1c1 2</ra1c1>
        <ra1c2 type="string">ra1c2 2</ra1c2>
        <ra1c3 type="string">ra1c3 2</ra1c3>
        <ra2 type="record">
            <ra2c1 type="string">aa2</ra2c1>
            <ra2c2 type="string">bb2</ra2c2>
        </ra2>
      </ra1_child>
    </ra1>
  </data>
</xmlio2>
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
