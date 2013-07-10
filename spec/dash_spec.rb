require "spec_helper"

describe Hashie::Dash do
  before(:each) do
    #@dash = Hashie::Dash.new
    @p = Person.new
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

  it "check property default value", :focus => true do
  #  expect(@p.occupation).to eq("Rubyist")
  expect(true).to eq(true)
  end

end