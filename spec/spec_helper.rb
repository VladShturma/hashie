require "bundler/setup"
Bundler.require

# ($:).inspect

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

spec_path = File.expand_path("..", __FILE__)
Dir["#{spec_path}/fixtures/*.rb"].each do |f|
  require f
end

RSpec.configure do |c|
#  c.filter_run :focus => true
  c.formatter = 'documentation'
end
