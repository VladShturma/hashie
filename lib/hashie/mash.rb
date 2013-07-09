module Hashie
	class Mash
		
		#attr_accessor :name
		
		def name?
			false
		end

		def name=(str)
		#	@name = str
		end
		
		def method_missing(method_name, *args)
      self.instance_eval do 
      	define_method(method_name) do
      		nil
      	end
      end
		end
	
	end
end