require "spec_helper"

describe Hashie::Dash do
  before(:each) do
    @dash = Hashie::Dash.new
  end

  it "test 1" do
    class Person < Hashie::Dash
      property :name
      property :email
    end
    p = Person.new
    p.email = "a@rr.ru"

    expect(p[:name]).to eq(nil)
    expect(p[:awesome]).to eq("NoMethodError")
    expect(p[:email]).to eq("a@rr.ru")
  end

  after(:each) do
    @dash = nil
  end
end