require "spec_helper"

describe Hashie::Mash do
  before(:each) do
    @mash = Hashie::Mash.new
  end

  it "checks that methods is not known" do
    expect(@mash.name?).to eq(false)
  end

  it "checks that method is without value" do
    @mash.name
    expect(@mash.name).to eq(nil)
    expect(@mash.name?).to eq(false)
  end

  it "checks that method has a value" do
    @mash.name = "My Mash"
    expect(@mash.name?).to eq(true)
    expect(@mash.name).to eq("My Mash")
  end

  it "checks multi-level assignment" do
    @mash.author!.name = "Michael Bleigh"
  end

  it "checks multi-level testing" do
    expect(@mash.author_.name?).to eq(false)
  end

  it "checks multi-level testing for existing method" do
    expect(@mash.author_.name?).to eq(false)
    @mash.author!.name = "Albert"
    expect(@mash.author_.name?).to eq(true)
  end

end