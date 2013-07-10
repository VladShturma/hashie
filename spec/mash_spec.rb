require "spec_helper"

describe Hashie::Mash do
  before(:each) do
    @mash = Hashie::Mash.new
  end

  it "test 1" do
    expect(@mash.name?).to eq(false)
    @mash.name
    expect(@mash.name).to eq(nil)
    expect(@mash.name?).to eq(false)
    @mash.name = "My Mash"
    expect(@mash.name?).to eq(true)
    expect(@mash.name).to eq("My Mash")
    #expect(@mash.inspect).to eq('<Hashie::Mash name="My Mash">')
  end

  it "test 2" do
    @mash.author!.name = "Michael Bleigh"
    #expect(@mash.author).to eq('<Hashie::Mash name="Michael Bleigh">')
  end

  it "test 3" do
    expect(@mash.author_.name?).to eq(false)
    #expect(@mash.inspect).to eq('<Hashie::Mash>')
  end

  it "test 4" do
    expect(@mash.author_.name?).to eq(false)
    @mash.author!.name = "Albert"
    expect(@mash.author_.name?).to eq(true)
  end

  after(:each) do
    @mash = nil
  end
end