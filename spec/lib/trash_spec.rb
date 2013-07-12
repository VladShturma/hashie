require "spec_helper"

describe Hashie::Trash do

 it "check that property can be assigned" do
    m = Men.new(:firstName => "Bob")
    expect(m[:first_name]).to eq("Bob")
    expect(m.first_name).to eq("Bob")
    expect(m[:firstName]).to eq("Bob")
    expect(m.firstName).to eq("Bob")
  end

  it "check trash lambda" do
    res = Result.new(:id => '123', :creation_date => '2012-03-30 17:23:28')
    expect(res.id).to eq(123)
    expect(res.alias_id).to eq(123)
    expect(res.created_at.class).to eq(Time)
  end
end