source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem 'omniauth-github'

gem 'jquery-rails'
gem 'bootstrap'
gem 'font-awesome-rails'

# ckeditor with refile
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'refile', require: "refile/rails", github: 'refile/refile', branch: 'master'
gem 'refile-mini_magick', github: 'refile/refile-mini_magick', branch: 'master'
#gem 'sinatra', github: 'sinatra/sinatra'

# cocoon allows nested attributes but requires underscore/bootstrap
gem 'underscore-rails'
gem 'cocoon'
gem 'mechanize'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'cancancan'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'cowsay'
gem 'simple_form'
gem 'friendly_id', '~> 5.2.3'
gem 'faraday' #for http requests
gem 'will_paginate', '~> 3.1.0'
gem 'chosen-rails'

gem 'lodash-rails'

# making model sortable
gem 'jquery-ui-rails'
gem 'record_tag_helper', '~> 1.0'
gem 'acts_as_list'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'hirb'
  gem 'letter_opener'
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
