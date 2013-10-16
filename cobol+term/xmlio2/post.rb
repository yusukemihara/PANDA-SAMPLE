#!/usr/bin/ruby

require 'pp'
require 'uri'
require 'net/http'

Net::HTTP.version_1_1

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
<?xml version="1.0" encoding="UTF-8"?>
<xmlio2>
  <head type="record">
    <meta type="string">hogehoge</meta>
    <version type="int">1</version>
  </head>
  <body type="record">
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
        <ra2 type="array">
          <!-- 0 -->
          <ra2_child type="record">
            <ra2c1 type="string">aa</ra2c1>
            <ra2c2 type="string">bb</ra2c2>
          </ra2_child>
          <!-- 1 -->
          <ra2_child type="record">
            <ra2c1 type="string">ra2c1 1</ra2c1>
            <ra2c2 type="string">ra2c2 1</ra2c2>
          </ra2_child>
          <!-- 2 -->
          <ra2_child type="record">
            <ra2c1 type="string">ra2c1 2</ra2c1>
            <ra2c2 type="string">ra2c2 2</ra2c2>
          </ra2_child>
        </ra2>
      </ra1_child>
      <!-- 1 --> <!-- partial empty -->
      <ra1_child type="record">
        <ra1c1 type="string">ra1c1 1</ra1c1>
        <ra1c2 type="string">ra1c2 1</ra1c2>
        <ra1c3 type="string">ra1c3 1</ra1c3>
        <ra2 type="array">
          <!-- 0 -->
          <ra2_child type="record">         
            <ra2c1 type="string"></ra2c1>
            <ra2c2 type="string"></ra2c2>
          </ra2_child>
          <!-- 1 -->
          <ra2_child type="record">         
            <ra2c1 type="string">ra2c1 1</ra2c1>
            <ra2c2 type="string">ra2c2 1</ra2c2>
          </ra2_child>
          <!-- 2 -->
          <ra2_child type="record">         
            <ra2c1 type="string">ra2c1 2</ra2c1>
            <ra2c2 type="string">ra2c2 2</ra2c2>
          </ra2_child>
        </ra2>
      </ra1_child>
      <!-- 2 --> <!-- empty -->
      <ra1_child type="record">
        <ra1c1 type="string"></ra1c1>
        <ra1c2 type="string"></ra1c2>
        <ra1c3 type="string"></ra1c3>
        <ra2 type="array">
          <!-- 0 -->
          <ra2_child type="record">         
            <ra2c1 type="string"></ra2c1>
            <ra2c2 type="string"></ra2c2>
          </ra2_child>
          <!-- 1 -->
          <ra2_child type="record">         
            <ra2c1 type="string"></ra2c1>
            <ra2c2 type="string"></ra2c2>
          </ra2_child>
          <!-- 2 -->
          <ra2_child type="record">         
            <ra2c1 type="string"></ra2c1>
            <ra2c2 type="string"></ra2c2>
          </ra2_child>
        </ra2>
      </ra1_child>
    </ra1>
  </body>
  <body type="record">
    <c1 type="string">only c1,it's OK!</c1>
  </body>
</xmlio2>
EOF

req.content_length = record_in.size
req.content_type = "application/xml"
req.body = record_in
req.basic_auth("sample", "sample")

1.times {

Net::HTTP.start("localhost", 8000) {|http|
  res = http.request(req)
  puts res.body
  pp res
}

sleep 1
}
