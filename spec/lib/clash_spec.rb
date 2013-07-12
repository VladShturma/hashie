require "spec_helper"

describe Hashie::Clash do

 it 'checks that create hash' do
    c = Hashie::Clash.new
    c.where(:abc => 'def').order(:created_at)
    expect(c).to eq({:where => {:abc => 'def'}, :order => :created_at})
  end

  it 'checks that merge hashes' do
    c = Hashie::Clash.new
    c.where(:abc => 'def').where(:hgi => 123)
    expect(c).to eq({:where => {:abc => 'def', :hgi => 123}})
  end

  it 'checks that chain into sub-hashes' do
    c = Hashie::Clash.new
    c.where!.abc('def').ghi(123)._end!.order(:created_at)
    expect(c).to eq({:where => {:abc => 'def', :ghi => 123}, :order => :created_at})
  end
end