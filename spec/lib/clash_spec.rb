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

  it 'check empty sub-hashes' do
    c = Hashie::Clash.new
    c.where!
    expect(c).to eq({:where => {}})
  end

  it 'check sub-hashes' do
    c = Hashie::Clash.new
    c.where!.abc('def')
    expect(c).to eq({:where => {:abc => 'def'}})
  end

  it 'check sub-hashes level 2 empty' do
    c = Hashie::Clash.new
    c.where!.abc('def').some!
    expect(c).to eq({:where => {:abc => 'def', :some => {}}})
  end

  it 'check sub-hashes level 2 not empty' do
    c = Hashie::Clash.new
    c.where!.abc('def').some!.ghi(123)
    expect(c).to eq({:where => {:abc => 'def', :some => {:ghi => 123}}})
  end

  it 'check jump to level 1' do
    c = Hashie::Clash.new
    c.where!.abc('def').some!.ghi(123)._end!.ttt(333)
    expect(c).to eq({:where => {:abc => 'def', :some => {:ghi => 123}, :ttt => 333}})
  end

  it 'check multi level work' do
    c = Hashie::Clash.new
    c.where!.abc('def').some!.ghi(123).aaa!.el('elem')._end!._end!.fin('finish')
    expect(c).to eq({:where => {:abc => 'def', :some => {:ghi => 123, :aaa => {:el =>"elem"}}, :fin => "finish"}})
  end

end