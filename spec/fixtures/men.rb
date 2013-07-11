class Men < Hashie::Trash
  property :first_name, :from => :firstName
  property :email
end