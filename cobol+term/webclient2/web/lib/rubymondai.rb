$:.unshift("/usr/lib")
require 'rubymondai.so'
require 'yaml'
require 'pp'

module Rubymondai
  class ArrayValue
    def to_a
      ret = []
      self.size.times do |i|
        v = self[i]
        if v.instance_of?(Rubymondai::RecordValue)
          ret[i] = v.to_h
        elsif v.instance_of?(Rubymondai::ArrayValue)
          ret[i] = v.to_a
        else
          ret[i] = v
        end
      end
      ret
    end
  
    def from_a(a)
      return unless a.instance_of?(Array)
      a.each_with_index do |v,i|
        return if i >= self.size
        c = self[i]
        if c.instance_of?(Rubymondai::RecordValue)
          c.from_h(v)
        elsif c.instance_of?(Rubymondai::ArrayValue)
          c.from_a(v)
        else
          self[i] = v
        end
      end
    end
  end

  class RecordValue
    def to_h
      ret = {}
      self.keys.each do |k|
        v = self[k]
        if v.instance_of?(Rubymondai::RecordValue)
          ret[k] = v.to_h
        elsif v.instance_of?(Rubymondai::ArrayValue)
          ret[k] = v.to_a
        else
          ret[k] = v
        end
      end
      ret
    end

    def _to_h(window)
      ret = {}
      ret[window] = self.to_h
      ret
    end

    def from_h(h)
      return unless h.instance_of?(Hash)
      h.each do |k,v|
        c = self[k]
        if c.instance_of?(Rubymondai::RecordValue)
          c.from_h(v)
        elsif c.instance_of?(Rubymondai::ArrayValue)
          c.from_a(v)
        else
          self[k] = v
        end
      end
    end

    def _from_h(h)
      h.each do |k,v|
        from_h(v)
      end
    end
  end
end

if $0 == __FILE__
  recdef = <<-EOS
    window1 {
        title   varchar(256);
        popup_summary   varchar(256);
        popup_body      varchar(1024);
        popup_icon      varchar(256);
        popup_timeout   int;
        fixed1  {
                label1 {
                        labeldata1 varchar(256);
                };
                pandaentry1     {
                        entrydata1 varchar(256);
                };
        }[10];
     };
  EOS
  val = Rubymondai::RecordValue.new(recdef)
  val["fixed1[0].pandaentry1.entrydata1"] = "hoge"
  val["fixed1[0].label1.labeldata1"] = "moge"
  p val.class
  h = val._to_h("window1")
  h2 = h["window1"]
  h2["fixed1"][5]["label1"]["labeldata1"] = "gugya----"
  val.from_h(h2)
  pp val._to_h("window1")
exit 0

  json = <<-EOS
---
window1__fixed1__pandaentry1:
  window1__fixed1__pandaentry1__entrydata1: age_age
window1:
  window1__title:
  window1__popup_timeout:
  window1__popup_summary:
  window1__popup_body:
  window1__popup_icon:
window1__fixed1__label1:
  window1__fixed1__label1__labeldata1: soge_soge
  EOS
  val.update_from_hash(YAML.load(json))

  p val["fixed1.pandaentry1.entrydata1"]
  p val["fixed1.label1.labeldata1"]

end
