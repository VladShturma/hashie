require "hashie/common_methods"

module Hashie
  class Dash
    include CommonMethods

    @@properties = Hash.new

    def self.property(property_name)
      @@properties[property_name] = nil
    end

    def args_to_value(*args)
      args.join(" ").to_sym
    end

    def self.set_prop(key, val)
      @@properties[key] = val
    end

    def method_missing(method_name, *args)
      name_str = method_name.to_s
      case name_str[-1]
        when "="            
          name = get_method_name(name_str)
          self.class.set_prop(name, args.join(" "))
        else
          properties = self.class.class_variable_get :@@properties
          key = args_to_value(*args)
          return "NoMethodError" unless properties.keys.include?(key)
          properties[key]
      end 
    end

  end
end