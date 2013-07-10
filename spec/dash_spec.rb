require "spec_helper"

describe Hashie::Dash do
  before(:each) do
    #@dash = Hashie::Dash.new
    @p = Person.new
  end

  it "checks that property is undefined" do
    expect(@p[:awesome]).to eq("NoMethodError")
  end

  it "checks that property is defined" do
    expect(@p[:name]).to eq(nil)
  end
end