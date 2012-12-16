source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'thin'
gem 'jquery-rails'
gem 'simple_form'
gem 'twitter-bootstrap-rails', '~> 2.1.7'
gem 'haml-rails'

gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-identity'
gem 'bcrypt-ruby', '~> 3.0.0'

gem 'friendly_id',  '~> 4.0.1'

# language detect
gem 'cld'

# markdown
gem 'redcarpet'

# automatically link URLs for quote sources
gem 'rails_autolink'

gem 'public_activity'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'quiet_assets'
end

group :test, :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'database_cleaner'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'

  # need these 2 gems to temporary fix twitter-bootstrap-rails bug
  gem 'less-rails'
  gem 'therubyracer'
end

group :production do
  gem 'pg'
  gem 'exception_notification'
end