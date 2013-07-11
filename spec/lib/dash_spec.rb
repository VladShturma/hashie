require "spec_helper"

describe Hashie::Dash do

  before(:all) do
    @p = Person.new(:age => 22)
  end

  it "checks that property is undefined" do
    expect{@p[:awesome]}.to raise_error NoMethodError
  end

  it "checks that property is defined" do
    expect(@p[:name]).to eq(nil)
  end

  it "check that property assigning" do
    @p.email = "Bob"
    expect(@p[:email]).to eq("Bob")
  end

  it "check that return value by key" do
    @p.email = "a@ru.ru"
    expect(@p.email).to eq("a@ru.ru")
  end

  it "check property default value" do
    expect(@p.occupation).to eq("Rubyist")
  end

  it "checks that property is set" do
    expect(@p.age).to eq(22)
  end

  it "checks that property can't be nil" do
    expect{@p.age = nil}.to raise_error(ArgumentError, 'The property "age" is required for this Dash.')
  end

  it "checks that can't initialize without required properties" do
    expect{x = Person.new}.to raise_error(ArgumentError, 'The property "age" is required for this Dash.')
  end

  it "checks that can't initialize without required properties 2" do
    expect{x = Person.new(:name => "Bob")}.to raise_error(ArgumentError, 'The property "age" is required for this Dash.')
  end

end