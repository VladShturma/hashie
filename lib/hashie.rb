require "hashie/version"

module Hashie
  autoload 'CommonMethods', 'hashie/common_methods'
  autoload 'Mash', 'hashie/mash'
  autoload 'Dash', 'hashie/dash'
  autoload 'Trash', 'hashie/trash'

  #lib_path = File.expand_path("..", __FILE__)
  #Dir["#{lib_path}/hashie/*.rb"].each do |f|
  #  require f
  #end

end
