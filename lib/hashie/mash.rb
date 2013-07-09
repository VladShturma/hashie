module Hashie
  class Mash

    def which_method(str,reg_exp)
      position = reg_exp=~str
      position != nil
    end

    def method_question_defined?(method_name)
      str = method_name.to_s.delete "?"
      if self.class.instance_methods.include?(str.to_sym)
        true
      else
        false
      end
    end

    def create_method(method_name)
      self.class.class_eval do
        define_method(method_name) do
          nil
        end
      end
      self.send(method_name)
    end

    def method_missing(method_name, *args)
      if which_method(method_name.to_s, /\?$/)
        method_question_defined?(method_name)
      else
        create_method(method_name)
      end
    end

=begin
    def create_method_equal(method_name, *args)
      self.class.class_eval do
        define_method(method_name) do
          args.join(' ')
        end
      end
    end

    def method_missing(method_name, *args)
      if which_method(method_name.to_s, /\=$/)   
        create_method_equal(method_name, *args)
      else
        is_question =  which_method(method_name.to_s, /\?$/)
          create_method(method_name, is_question)
      end
    end
=end

  end
end