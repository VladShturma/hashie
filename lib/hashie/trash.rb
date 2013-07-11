
module Hashie
  class Trash < Hashie::Dash
    include CommonMethods

    def initialize(arg = {})
      @from ||= {}
      @from = self.class.instance_variable_get :@class_from
      new_hash = get_hash_by_alias(arg)
      super(new_hash)
    end

    def get_hash_by_alias(arg)
      arg.each do |key, value|
        return {@from.key(key) => value} if @from.value?(key)
      end
      arg
    end

    def self.property(arg, option = {})
      @class_from ||= {}
      @class_from[arg] = option[:from] if option.key?(:from)
      super
    end

    def [](property_name)
      property_name = @from.key(property_name) if @from.value?(property_name)
      super(property_name)
    end

  end
end