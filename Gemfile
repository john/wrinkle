source 'https://rubygems.org'
ruby '2.3.1'

gem 'attr_encrypted'
gem 'devise'
gem 'friendly_id', :git => 'https://github.com/norman/friendly_id.git'
gem 'google-api-client'
gem 'haml-rails'
gem 'humane-rails'
gem 'jquery-rails'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'pg'
gem 'puma'
gem 'rails', '>= 5.0.0', '< 5.1'
gem 'rails_admin'
gem 'rest-client', '>= 1.7.3'
gem 'quip'
gem 'rspec-rails'
gem 'sass-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'unirest', :git => 'https://github.com/Mashape/unirest-ruby'
gem 'will_paginate'

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'bundler-audit', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'vcr'
  gem 'webmock'
end

group :test do
  gem 'factory_girl_rails', require: false
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
