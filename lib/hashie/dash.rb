require "hashie/common_methods"

module Hashie
  class Dash
    include CommonMethods

    @@properties = Hash.new
    @@requires = Hash.new

    def initialize(arg)
      arg.each { |key, value| @@properties[key] = value }
    end
    
    def self.property(property_name, option = nil)
      @@properties[property_name] = nil
      if option != nil
        option.each do |key, value| 
          if key == :default
            @@properties[property_name] = value
          end
        end
      end

    end

    def [](property_name)
      if @@properties.keys.include?(property_name)
        #return @@defaults[property_name] if @@defaults[property_name]!=nil
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