source 'https://rubygems.org'
gem 'rails-assets-isInViewport', source: 'https://rails-assets.org'
gem 'rails-assets-jQuery-File-Upload', source: 'https://rails-assets.org'

ruby "2.3.4"
gem 'rails', '5.1.3'
gem 'pg'
gem 'puma'
gem 'puma_worker_killer'

# user accounts / admin
gem 'devise'
gem 'pundit'
gem 'activeadmin'

# monitoring
gem 'mini_magick'
gem 'rollbar'
gem 'oj', '~> 2.12.14'
gem 'lograge'

# model
gem 'simple_enum'
gem 'scenic', '~> 1.3'
gem 'validate_url'
gem 'paper_trail'

# forms / data manipulation / charts
gem 'cocoon'
gem 'kramdown'
gem 'groupdate'
gem 'rouge'
gem 'friendly_id', '~> 5.1.0'
gem 'client_side_validations'
gem 'country_select'
gem 'time_splitter'

# performance
gem 'fast_blank'

# javascript
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks', '~> 5.0.0'
gem 'lodash-rails'
gem 'browser'
gem 'coffee-rails'
gem 'webpacker', '~> 2.0'
gem 'paloma', '~> 5.1.0'

# css
gem 'sass-rails'
gem 'compass-rails'
gem 'momentjs-rails', '~> 2.9'

gem 'font-awesome-rails'
gem 'include_media_rails'

# search / pagination
gem 'ransack'
gem 'kaminari'
gem 'kaminari-cells'

# API / Docker
# gem 'rack-attack'
gem 'httparty'
gem 'excon'

# heroku / production
gem 'figaro'

# email
gem 'mandrill-api'
gem 'gibbon'

# background processing
gem 'sidekiq'
gem "sidekiq-cron", "~> 0.6.3"
gem 'sidekiq-history'
gem 'sidekiq-failures'
gem 'sidekiq-unique-jobs'
gem 'sinatra', :require => nil

# images
gem 'carrierwave', '~> 1.0'
gem "remotipart"
gem 'net-ssh'
gem 'inline_svg'
gem 'file_validators'

# Amazon
gem 'aws-sdk', '~> 2.2'
gem 'fog'

# View
gem "trailblazer"
gem "trailblazer-rails"
gem "cells-rails", git: 'https://github.com/trailblazer/cells-rails'
gem "cells"
gem "cells-erb"
gem 'record_tag_helper', '~> 1.0'


group :development, :test do
  gem "rspec-cells"
end

# static analysis
group :development do
  gem 'brakeman', :require => false
  gem 'derailed_benchmarks'
  gem 'stackprof'
end


group :development do
  gem 'seed_dump'
  gem 'guard'
  gem 'rails-erd'
  gem 'sdoc', '~> 0.4.0'
  gem 'web-console'
  gem 'scss_lint', require: false
  gem 'shog'
  gem 'meta_request'
end


group :development, :test do
  gem 'byebug'
  gem 'ffaker'
  gem 'spring'
  gem 'table_print'
  gem 'rspec-rails', '~> 3.6'
  gem 'rspec-kickstarter'
  gem 'to_factory'
  gem 'traceroute'
end

group :test do
  gem "factory_girl_rails"
  gem 'simplecov', :require => false
  gem 'capybara'
  gem 'capybara-email'
  gem 'capybara-screenshot'
  gem 'capybara-webkit', '1.12.0'
  gem 'database_cleaner'
  gem "launchy"
  gem 'shoulda'
  gem 'timecop'
  gem 'shoulda-matchers', require: false
  gem 'sanitize'
  gem 'rails-controller-testing'
  gem 'pundit-matchers', git: 'https://github.com/crowdAI/pundit-matchers'
end
