require "spec_helper"

describe Hashie::Trash do

 it "check that property can be assigned" do
    m = Men.new(:firstName => "Bob")
    #m = Men.new
    #raise m.inspect
    expect(m[:first_name]).to eq("Bob")
    expect(m.first_name).to eq("Bob")
    expect(m[:firstName]).to eq("Bob")
    expect(m.firstName).to eq("Bob")
  end

end