require "hashie/common_methods"

module Hashie
  class Dash
    include CommonMethods

    @@properties = Hash.new

    def self.property(property_name, option = nil)
      #@@properties[property_name] = nil

      @@properties[property_name] = {property_name => nil, option => 2}
      puts
      puts
      puts @@properties
      puts
      puts

      #raise @@properties[property_name].inspect
      #raise option.inspect
    end

    def [](property_name)
      if @@properties.keys.include?(property_name)
        @@properties[property_name]
      else
        raise NoMethodError
      end
    end

    def method_missing(method_name, *args)
      name_str = method_name.to_s
      case name_str[-1]
        when "="
          name = get_method_name(name_str)
          @@properties[name] = args.join(" ")
        else
          self.[](method_name)
      end      
    end

  end
end