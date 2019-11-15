source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# The CORS spec allows web applications to make cross-domain AJAX calls without using workarounds such as JSONP.
gem 'rack-cors', '1.0.5'
# Json api serializer
gem 'active_model_serializers'
# Rack middleware for blocking & throttling
gem 'rack-attack', '5.4.2'
# Token based authentication for Rails JSON APIs. Designed to work with jToker and ng-token-auth.
gem 'devise_token_auth', '1.1.0'
gem 'omniauth', '1.9.0'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit', '1.1.0'
# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for modern web app frameworks and ORMs
gem 'kaminari', '1.1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Write ruby code better
  gem 'rubocop', '~> 0.72.0', require: false
  # rspec-rails brings the RSpec testing framework to Ruby on Rails as a drop-in 
  # alternative to its default testing framework, Minitest.
  gem 'rspec-rails', '3.8.2'
  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners to test common Rails functionality that, 
  #if written by hand, would be much longer, more complex, and error-prone.
  gem 'shoulda-matchers', '~> 3.0', require: false
  # A set of RSpec matchers for testing Pundit authorisation policies. The matcher syntax was inspired 
  # by this excellent blog post from Thunderbolt Labs.
  gem 'pundit-matchers', '~> 1.4.1'
  # Database Cleaner is a set of strategies for cleaning your database in Ruby.
  gem 'database_cleaner', '~> 1.5'
  # factory_bot is a fixtures replacement with a straightforward definition syntax, support for multiple build 
  # strategies (saved instances, unsaved instances, attribute hashes, and stubbed objects), and support for multiple 
  # factories for the same class (user, admin_user, and so on), including factory inheritance.
  gem 'factory_bot_rails'
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem 'faker', '1.8.7'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
