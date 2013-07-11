
module Hashie
  class Dash
    include CommonMethods

    def initialize(arg = {})
      @props ||= {}
      @reqs ||= {}
      @props = self.class.instance_variable_get :@properties
      @reqs = self.class.instance_variable_get :@requires
      generate_error_argument_require if is_not_all_requires_are_set?(arg)
      arg.each { |key, value| @props[key] = value }
    end

    def self.property(arg, option = {})
      @properties ||= {}
      @requires ||= {}
      @properties[arg] = option[:default]
      @requires[arg] = true if option.has_key?(:required)
    end

    def [](property_name)
      if @props.keys.include?(property_name)
        @props[property_name]
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
    def is_not_all_requires_are_set?(arg)
      (@reqs.keys & arg.keys) != (@reqs.keys)
    end

    def generate_error_argument_require
      raise ArgumentError, "The property \"name\" is required for this Dash."
    end

    def set_property(prop_name, *args)
      name = get_method_name(prop_name)
      if @reqs.has_key?(name) && args[0] == nil
        generate_error_argument_require
      end
      @props[name] = args.join(" ")
    end

  end
end