module Hashie
  class Mash

    def method_question_defined?(method_name)
      str = method_name.to_s.delete "?"
      if self.class.instance_methods.include?(str.to_sym)
        true
      else
        false
      end
    end

    def create_method(method_name, *args)
      str = method_name.to_s.delete "="
      self.class.class_eval do
        define_method(str.to_sym) do
          args.join(" ")
        end
      end
    end

    def method_missing(method_name, *args)
      if method_name.to_s[-1] == "?"
        method_question_defined?(method_name)
      elsif method_name.to_s[-1] == "="
        create_method(method_name, *args)
      else
        nil
      end
    end

  end
end