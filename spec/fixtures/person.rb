class Person < Hashie::Dash
  #property :age, :required => true
  property :occupation, :default => 'Rubyist'
  property :name, :required => true
  property :email
end