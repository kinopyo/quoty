source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.1.0.beta1'
gem 'turbolinks'
gem 'nprogress-rails'
gem 'jquery-turbolinks'
gem 'thin'
gem 'jquery-rails'
gem 'simple_form', '~> 3.0.0'
gem 'nested_form'

gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails', branch: 'bootstrap3'
gem 'less-rails'
gem 'therubyracer', '0.12.0'

gem 'haml-rails'

gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-identity'
gem 'bcrypt-ruby'

# have to specify github now
gem 'friendly_id', github: 'norman/friendly_id', ref: 'master'
gem 'babosa'

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

gem 'public_activity'

gem 'rack-mini-profiler'
gem 'carrierwave'
gem 'rmagick', '~> 2.13.2'
gem 'fog', '~> 1.3.1'
gem 'ancestry'
gem 'jquery-ui-rails'
gem 'kaminari'

gem 'mousetrap-rails'

group :development do
  gem 'spring'
  gem 'spring-commands-rspec', require: false
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
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'rspec-json_matcher'
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
  gem 'timecop'
end

gem 'sass-rails',   '~> 4.0.0.rc1'
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
