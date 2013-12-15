require 'spec_helper'

describe 'friendly_id' do
  it "generates slug when save" do
    user = build(:user, name: 'my name')
    user.save

    expect(user.slug).to eq('my-name')
  end

  it "supports chinese, japanese names" do
    user = create(:user, name: '日本語')

    expect(user.slug).to eq('日本語')
  end

  it "uses id as the candidates if slug is already taken" do
    now = Time.local(2013, 12, 15)
    Timecop.freeze(now)
    user_1 = create(:user, name: 'foo')
    user_2 = create(:user, name: 'foo')

    expect(user_2.slug).to eq("foo-#{now.to_i}")
  end
end
