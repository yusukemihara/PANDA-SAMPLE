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

req = Net::HTTP::Post.new("/test1/test1")
body = <<EOF
<msg type="array">
  <msg_child type="record">
    <c1 type="string">c1</c1>
    <i1 type="int">1</i1>
    <n1 type="number">10.999</n1>
    <a1 type="array">
      <a1_child type="int">1</a1_child>
      <a1_child type="int">2</a1_child>
      <a1_child type="int">3</a1_child>
      <a1_child type="int">4</a1_child>
      <a1_child type="int">5</a1_child>
    </a1>
    <r1 type="array">
      <r1_child type="record">
        <r1c1 type="string">r1c1</r1c1>
        <r2 type="record">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">r1c1</r1c1>
        <r2 type="record">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">r1c1</r1c1>
        <r2 type="record">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">errorerrorerrorerror</r1c1>
        <r2 type="record">
          <r2c1 type="string">errorerrorerror</r2c1>
        </r2>
      </r1_child>
    </r1>
  </msg_child>
  <msg_child type="record">
    <c1 type="string">c1-2</c1>
    <i1 type="int">2</i1>
    <n1 type="number">10.999</n1>
    <a1 type="array">
      <a1_child type="int">1</a1_child>
      <a1_child type="int">2</a1_child>
      <a1_child type="int">3</a1_child>
      <a1_child type="int">4</a1_child>
      <a1_child type="int">5</a1_child>
    </a1>
    <r1 type="array">
      <r1_child type="record">
        <r1c1 type="string">r1c1</r1c1>
        <r2 type="record">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">r1c1</r1c1>
        <r2 type="record">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">r1c1</r1c1>
        <r2 type="record">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">errorerrorerrorerror</r1c1>
        <r2 type="record">
          <r2c1 type="string">errorerrorerror</r2c1>
        </r2>
      </r1_child>
    </r1>
  </msg_child>
  <msg_child type="record">
    <c1 type="string">c1-3</c1>
    <i1 type="int">3</i1>
    <n1 type="number">10.999</n1>
    <a1 type="array">
      <a1_child type="int">1</a1_child>
      <a1_child type="int">2</a1_child>
      <a1_child type="int">3</a1_child>
      <a1_child type="int">4</a1_child>
      <a1_child type="int">5</a1_child>
    </a1>
    <r1 type="array">
      <r1_child type="record">
        <r1c1 type="string">r1c1</r1c1>
        <r2 type="record">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">r1c1</r1c1>
        <r2 type="record">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">r1c1</r1c1>
        <r2 type="record">
          <r2c1 type="string">r2c1</r2c1>
        </r2>
      </r1_child>
      <r1_child type="record">
        <r1c1 type="string">errorerrorerrorerror</r1c1>
        <r2 type="record">
          <r2c1 type="string">errorerrorerror</r2c1>
        </r2>
      </r1_child>
    </r1>
  </msg_child>
</msg>
EOF

req.content_type = "application/xml"
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
