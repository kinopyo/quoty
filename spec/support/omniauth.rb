RSpec.configure do |config|
  config.before(:each) do
    OmniAuth.config.test_mode = true
  end

  OmniAuth.config.mock_auth[:twitter] = {
    provider: 'twitter',
    uid: '1234',
    token: 'asdf1234',
    info: {
      name: 'Alice',
      image: 'http://example.com/photo.png',
      email: 'foo@bar.com',
      description: 'Hi my name is Alice',
    }
  }
end
