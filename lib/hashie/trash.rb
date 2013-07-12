
module Hashie
  class Trash < Dash
    include CommonMethods
    LAMBDA_KEYS = [:transform_with, :with]

    def initialize(arg = {})
      @from ||= {}
      @lamb ||= {}
      @from = self.class.instance_variable_get :@class_from
      @lamb = self.class.instance_variable_get :@class_lambda
      new_hash = get_hash_by_alias(arg)
      super(new_hash)
    end

    private
    def get_hash_by_alias(arg)
      res = Hash.new
      arg.each do |key, value|
        if @from.value?(key)
          res[@from.key(key)] = value
        else
          res[key] = value
        end
      end
      res
    end

    public
    def self.property(arg, option = {})
      @class_from ||= {}
      @class_lambda ||= {}
      @class_from[arg] = option[:from] if option.key?(:from)
      detect_lambdas(arg, option)
      super
    end

    private
    def self.detect_lambdas(arg, option)
      LAMBDA_KEYS.each do |item|
        @class_lambda[arg] = option[item] if option.key?(item)
      end
    end

    public
    def [](property_name)
      property_name = @from.key(property_name) if @from.value?(property_name)
      if @lamb[property_name]
        @lamb[property_name].call(@props[property_name])
      else
        super(property_name)
      end
    end

  end
end