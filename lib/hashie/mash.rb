module Hashie
  class Mash
    
    def which_method(str,reg_exp)
      position = reg_exp=~str
      position != nil
    end

    def create_method(method_name, is_question)
      self.class.class_eval do
        define_method(method_name) do
          is_question ? false : nil
        end
      end
      self.send(method_name)
    end

    def create_method_equal(method_name, *args)
      "My Mash"
    end

    def method_missing(method_name, *args)
      if which_method(method_name.to_s, /\=$/)   
        create_method_equal(method_name, *args)
      else
        is_question =  which_method(method_name.to_s, /\?$/)
          create_method(method_name, is_question)
      end
    end
  
  end
end