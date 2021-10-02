source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
gem 'rails', '~> 5.2.6'
gem 'puma', '~> 3.11'
gem 'bcrypt', '~> 3.1.7'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors'
gem 'active_model_serializers'
gem 'jwt', '~> 2.2'
gem 'cancancan', '~> 3.2'

group :development, :test do
  gem 'faker'
  gem 'rspec-rails', '~> 4.0'
  gem 'capybara'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'json_matchers'
  gem 'rspec-json_expectations'
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

group :production do
  gem 'pg'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
