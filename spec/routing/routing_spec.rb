require 'spec_helper'

describe 'routing' do
  it 'routes /language/english to quotes#language' do
    expect(get: '/language/english').to route_to(controller: 'quotes', action: 'language', language: 'english')
  end

  it 'does not route /language/1234' do
    expect(get: '/language/1234').not_to be_routable
  end
end