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
  def setup
  	@mash = Hashie::Mash.new
  end

	it "check name?" do
		setup
		expect(@mash.name?).to eq(false)
	end

	it "check name" do
		setup
		expect(@mash.name).to eq(nil)
	end
end