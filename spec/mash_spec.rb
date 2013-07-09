require "spec_helper"
require "hashie/mash"
# in spec/calculator_spec.rb
=begin
describe Calculator do
  describe '#add' do
    it 'returns the sum of its arguments' do
      expect(Calculator.new.add(1, 2)).to eq(3)
    end
  end
end
=end

describe Hashie::Mash do
  before(:each) do
    @mash = Hashie::Mash.new
  end

  it "check name?" do
    expect(@mash.name?).to eq(false)
  end

  it "check names" do
    expect(@mash.name).to eq(nil)
    expect(@mash.somemethod).to eq(nil)
  end

  it "check name=" do
    expect(@mash.name?).to eq(false)
    @mash.name
    expect(@mash.name).to eq(nil)
    @mash.name =  "My Mash"
    expect(@mash.name).to eq("My Mash")
    expect(@mash.name?).to eq(true)
  end

  it "check inspect" do
    @mash.name = "My Mash"
    expect(@mash.inspect).to eq('<Hashie::Mash name="My Mash">')
  end

  after(:each) do
    @mash = nil
  end
end