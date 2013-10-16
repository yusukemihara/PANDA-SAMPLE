$:.unshift("/usr/lib")
#$:.unshift("/home/mihara/montsuqi/libmondai14/src/.libs/")
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
          ret[i] = v._to_h
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
          c._from_h(v)
        elsif c.instance_of?(Rubymondai::ArrayValue)
          c.from_a(v)
        else
          self[i] = v
        end
      end
    end
  end

  class RecordValue
    def _to_h
      ret = {}
      self.keys.each do |k|
        v = self[k]
        if v.instance_of?(Rubymondai::RecordValue)
          ret[k] = v._to_h
        elsif v.instance_of?(Rubymondai::ArrayValue)
          ret[k] = v.to_a
        else
          ret[k] = v
        end
      end
      ret["__order"] = self.keys
      ret
    end

    def to_h()
      ret = {}
      puts self.record_name
      ret[self.record_name] = self._to_h
      ret
    end

    def _from_h(h)
      return unless h.instance_of?(Hash)
      h.each do |k,v|
        c = self[k]
        if c.instance_of?(Rubymondai::RecordValue)
          c._from_h(v)
        elsif c.instance_of?(Rubymondai::ArrayValue)
          c.from_a(v)
        else
          self[k] = v
        end
      end
    end

    def from_h(h)
      h.each do |k,v|
        _from_h(v)
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
  h = val.to_h()
pp h
  h["window1"]["fixed1"][5]["label1"]["labeldata1"] = "gugya----"
  val.from_h(h)
  pp val.to_h()

exit 0

end
