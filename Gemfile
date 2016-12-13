source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'attr_encrypted'
# can't remember why devise is from git, switch to rubygems when it's updated from July '16 build
gem 'devise', :git => 'https://github.com/plataformatec/devise.git'

gem 'friendly_id' #, :git => 'https://github.com/norman/friendly_id.git'
gem 'google-api-client'
gem 'haml-rails'
gem 'humane-rails'
gem 'jquery-rails'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-wordpress_hosted', git: 'https://github.com/john/omniauth-wordpress-oauth2-plugin.git'
gem 'pg'
gem 'public_activity'
gem 'puma'
gem 'rails', :git => 'https://github.com/rails/rails.git' #,, '>= 5.1.0.alpha', '< 5.2', using to take advantage of webpacker
gem 'rails_admin'
gem 'rest-client', '>= 2.0.0'
gem 'quip', :git => "https://github.com/john/quip-ruby.git"
gem 'rspec-rails'
gem 'sass-rails', github: "rails/sass-rails"
gem 'turbolinks', '~> 5'
gem 'uglifier'
gem 'webpacker', github: "rails/webpacker"
gem 'will_paginate'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :test do
  gem 'factory_girl_rails', require: false
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
end

group :development, :test do
  gem 'bundler-audit', require: false
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
