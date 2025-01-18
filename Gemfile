source "https://rubygems.org"

gem "rails", "~> 7.2.1"
gem "sprockets-rails"
gem "pg", "~> 1.5"
gem "puma", "6.4.2"
gem "jsbundling-rails"
gem "turbo-rails", "~> 1.0"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "bootsnap", require: false

gem "simple_form", "~> 5.1.0"
gem "redis"
gem "devise", "~> 4.9.4"
gem "devise-jwt"
gem "jsonapi-serializer"
gem "tailwindcss-rails", "2.7.6"

# Cron jobs
gem "whenever", require: false

# Background jobs
gem "sidekiq", require: false

gem "ed25519"
gem "bcrypt_pbkdf"


group :development, :test do

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
  gem "capistrano"
  gem "capistrano3-puma", "6.0.0.beta.1"
  gem "capistrano-rails", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-rvm"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Highlight the fine-grained location where an error occurred [https://github.com/ruby/error_highlight]
  gem "error_highlight", ">= 0.4.0", platforms: [ :ruby ]
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
