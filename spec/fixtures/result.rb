class Result < Hashie::Trash
  property :id, :from => :alias_id, :with => lambda { |v| v.to_i }
  property :created_at, :from => :creation_date, :transform_with => lambda { |v| Time.parse(v) }
end