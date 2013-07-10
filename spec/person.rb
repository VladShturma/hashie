class Person < Hashie::Dash
  property :occupation, :default => 'Rubyist'
  property :name    
  property :email
end
