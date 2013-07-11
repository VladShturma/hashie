class Person < Hashie::Dash
  property :occupation, :default => 'Rubyist'
  property :name, :required => true
  property :email
end