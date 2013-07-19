source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.0.0'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'thin'
gem 'jquery-rails'
gem 'simple_form', '3.0.0.rc'
gem 'nested_form'

gem 'twitter-bootstrap-rails', '~> 2.2.7'
gem 'less-rails'
gem 'therubyracer'

gem 'haml-rails'

gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-identity'
gem 'bcrypt-ruby', '~> 3.0.0'

# have to specify github now
gem 'friendly_id', '5.0.0.alpha1', github: 'FriendlyId/friendly_id'

gem 'active_model_serializers'

gem 'newrelic_rpm'

# memcache
gem 'dalli'
gem 'memcachier'

# language detect
gem 'cld'

# markdown
gem 'redcarpet'

gem 'sitemap_generator'
gem 'net-sftp'

# automatically link URLs for quote sources
gem 'rails_autolink'

gem 'public_activity', github: 'pokonski/public_activity', branch: 'rails4'

gem 'rack-mini-profiler'
gem 'carrierwave'
gem 'rmagick', '~> 2.13.2'
gem 'fog', '~> 1.3.1'
gem 'ancestry'
gem 'jquery-ui-rails'
gem 'kaminari'

gem 'mousetrap-rails'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'quiet_assets'
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

group :test do
  gem 'rspec-json_matcher'
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
end

gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

gem 'exception_notification', '~> 4.0.0'

group :production, :staging do
  gem 'pg'
  gem 'unicorn'
  gem 'rails_12factor' # heroku specific
end

# workaround for https://github.com/rails/rails-observers/issues/4
gem 'rails-observers', github: 'kinopyo/rails-observers'
