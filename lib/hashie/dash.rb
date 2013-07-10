require "hashie/common_methods"

module Hashie
  class Dash
    include CommonMethods

    @@properties = Hash.new
    @@requires = Hash.new

    def initialize(arg = {})
      if is_not_all_requires_are_set?(arg)
        push_argument_error_require(@@requires.keys[0])
      end
      arg.each do |key, value|
        @@properties[key] = value
      end
    end
    
    def self.property(property_name, option = nil)
      @@properties[property_name] = nil
      if option != nil
        set_property_option(property_name, option)
      end
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
          set_property(name_str, *args)
        else
          self.[](method_name)
      end      
    end

    private
    def self.set_property_option(property_name, option)
      option.each do |key, value| 
        if key == :default
          @@properties[property_name] = value
        elsif key == :required
          @@requires[property_name] = true
        end
      end
    end

    def is_not_all_requires_are_set?(arg)
      (@@requires.keys & arg.keys) != (@@requires.keys)
    end

    def push_argument_error_require(required_property = nil)
      raise ArgumentError, "The property \"#{required_property}\" is required for this Dash."
    end

    def set_property(prop_name, *args)
      name = get_method_name(prop_name)
      if @@requires.has_key?(name) && args[0] == nil
        push_argument_error_require(name)
      end
      @@properties[name] = args.join(" ")
    end
    
  end
end