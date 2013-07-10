require "hashie/common_methods"

module Hashie
  class Dash
    include CommonMethods

    @@properties = Hash.new
    @@requires = Hash.new

    def initialize(arg = nil)
      #raise ArgumentError, "The property \"#{name}\" is required for this Dash."
      if arg != nil
        arg.each do |key, value|
          if @@requires[key] !=   
          @@properties[key] = value
        end
      end
    end
    
    def self.property(property_name, option = nil)
      @@properties[property_name] = nil
      if option != nil
        option.each do |key, value| 
          if key == :default
            @@properties[property_name] = value
          elsif key == :required
            @@requires[property_name] = true
          end
        end
      end

    end

    def [](property_name)
      if @@properties.keys.include?(property_name)
        @@properties[property_name]
      else
        raise NoMethodError
      end
    end

    def set_property(prop_name, *args)
      name = get_method_name(prop_name)
      if @@requires[name] != nil && args[0] == nil
        raise ArgumentError, "The property \"#{name}\" is required for this Dash."
      end
      @@properties[name] = args.join(" ")
    end

    def method_missing(method_name, *args)
      name_str = method_name.to_s
      case name_str[-1]
        when "="
          s = set_property(name_str, *args)
        else
          self.[](method_name)
      end      
    end

  end
end