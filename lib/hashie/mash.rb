module Hashie
	class Mash
		
		def name?
			false
		end

		#def name=(str)
		#	@name = str
		#  nil
		#end
		def question_method?(str)
			position = /\?$/=~str
			position != nil ? true: false 
		end
		
		def method_missing(method_name, *args)
			method_name_str = method_name.to_s
			method_name_str =~ /\?$/

      self.class.class_eval do
      	define_method(method_name) do
      		nil
      	end
      end
      self.send(method_name)
		end
	
	end
end