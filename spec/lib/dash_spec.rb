require "spec_helper"

describe Hashie::Dash do

  before(:all) do
    @p = Person.new(:name => "Bob")
  end

  it "check that property is not set" do
    expect{p = Person.new}.to raise_error(ArgumentError, 'The property "name" is required for this Dash.')
  end

  it "check that property assigning" do
    expect(@p.name).to eq("Bob")
  end

  it "check that property assigning by []" do
    expect(@p[:name]).to eq("Bob")
  end

  it "checks that property is undefined" do
    expect{@p[:awesome]}.to raise_error NoMethodError
  end

  it "check property default value" do
    expect(@p.occupation).to eq("Rubyist")
  end

  it "check assignment value by =" do
    @p.email = "a@ru.ru"
    expect(@p.email).to eq("a@ru.ru")
  end

  it "checks that property can't be nil" do
    expect{@p.name = nil}.to raise_error(ArgumentError, 'The property "name" is required for this Dash.')
  end

  it "checks init with unknown property" do
    expect{p = Person.new({:name => "Bob", :first => "Bob"})}.to raise_error(ArgumentError, 'The property "name" is required for this Dash.')
  end

end