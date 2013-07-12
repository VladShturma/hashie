module Hashie
  class Clash < Hash
    include CommonMethods

    def method_missing(method_name, args = {})
      method_str = method_name.to_s
      if method_str == "_end!"
        @subhash = nil
      elsif method_str[-1] == "!"
        @subhash = get_method_name(method_str).to_sym
      else
        if @subhash
          fill_hash(@subhash, {method_name => args})
        else
          fill_hash(method_name, args)
        end
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