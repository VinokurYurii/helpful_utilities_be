# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.4'

gem 'active_model_serializers', '~> 0.10.2'
gem 'bootsnap', require: false
gem 'devise', '~> 4.9'
gem 'devise-jwt'
gem 'dotenv-rails'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'codecov', require: false
  gem 'debug', platforms: %i[mri windows]
  gem 'panolint', '~> 0.1.6'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'simplecov'
end

group :development do
  # gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
end

group :test do
  gem 'shoulda-matchers'
end
