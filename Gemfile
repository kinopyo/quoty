source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '3.2.11'

gem 'thin'
gem 'jquery-rails'
gem 'simple_form'
gem 'nested_form'

gem 'twitter-bootstrap-rails', '~> 2.1.9'
gem 'less-rails'
gem 'therubyracer'

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

gem 'sitemap_generator'
gem 'net-sftp'

# automatically link URLs for quote sources
gem 'rails_autolink'

gem 'public_activity'

gem 'rack-mini-profiler'
gem 'carrierwave'
gem 'rmagick', '~> 2.13.2'
gem 'fog'
gem 'ancestry'
gem 'jquery-ui-rails'
gem 'kaminari'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'quiet_assets'
  gem 'rails-footnotes', '>= 3.7.9'
  gem 'letter_opener'
end

group :test, :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.13.0'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'database_cleaner'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
  # use master branch for this issue: https://github.com/smartinez87/exception_notification/issues/103
  gem 'exception_notification', git: 'git://github.com/smartinez87/exception_notification.git'
end