
module Hashie
  class Mash
    include CommonMethods

    def initialize
      @hash_store = Hash.new
    end

    private
    def method_finded?(method_name)
      res = @hash_store[method_name]
      res != nil
    end

    public
    def method_missing(method_name, *args)
      name_str = method_name.to_s
      case name_str[-1]
        when "?"
          name = get_method_name(name_str)
          method_finded?(name)
        when "="            
          name = get_method_name(name_str)
          @hash_store[name] = args.join(" ")
        when "!"
          name = get_method_name(name_str)
          @hash_store[name] = Mash.new
        when "_"
          name = get_method_name(name_str)
          if method_finded?(name)
            @hash_store[name]
          else
            Mash.new
          end
        else
          @hash_store[method_name]
      end 
    end

  end
end