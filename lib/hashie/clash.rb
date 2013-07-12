module Hashie
  class Clash < Hash
    include CommonMethods

    def initialize(prev_level = nil)
      @prev_level = prev_level
    end

    def _end!
      @prev_level
    end

    def method_missing(method_name, args = {})
      method_str = method_name.to_s

      if method_str[-1] == "!"
        method_name = get_method_name(method_str).to_sym
        self[method_name] = Clash.new(self)
        return self[method_name]
      else
        fill_hash(method_name, args)
      end
      self
    end

    private
    def fill_hash(key,arg)
      if self[key]
        self[key].merge!(arg)
      else
        self[key] = arg
      end
    end

  end
end