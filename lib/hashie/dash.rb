
module Hashie
  class Dash
    #include CommonMethods

    def initialize
      #tmp = self.class.instance_variable_get :@properties
      #raise "XXXXXX" << tmp.inspect
      @props ||= {}
      @props = self.class.instance_variable_get :@properties
    end

    def self.property(arg, option = nil)
      @properties ||= {}
      @properties[arg] = nil
    end

    def get_props
      @props
    end

=begin
    @@properties = Hash.new
    @@requires = Hash.new

    def initialize(arg = {})
      if is_not_all_requires_are_set?(arg)
        push_argument_error_require(@@requires.keys[0])
      end
      arg.each { |key, value| @@properties[key] = value }
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
      @@properties[property_name] = option[:default]
      @@requires[property_name] = true if option.has_key?(:required)
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
=end
  end
end