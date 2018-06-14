source 'https://rubygems.org'
source 'https://rails-assets.org'

# Rails assets gems
gem 'rails-assets-isInViewport'
gem 'rails-assets-jQuery-File-Upload'

ruby '2.5.1'
gem 'rails', '5.2.0'
gem 'pg'
gem 'puma'
gem 'puma_worker_killer'

# user accounts / admin
gem 'devise'
gem 'pundit'
gem 'activeadmin'
gem 'crowdai_admin'
#gem 'crowdai_admin',
#      path: '/Users/sean/src/crowdai/crowdai_admin'
gem 'doorkeeper', '~> 5.0.0.rc1'

# monitoring
gem 'mini_magick'
gem 'rollbar'
gem 'oj', '~> 3.0'
gem 'lograge'
gem 'erbse', '0.1.1'

# model
gem 'simple_enum'
gem 'scenic', '~> 1.3'
gem 'validate_url'
gem 'paper_trail'
gem 'valid_email2'
gem "active_model_serializers"
gem 'activestorage'

# forms / data manipulation / charts
gem 'cocoon'
gem 'kramdown'
gem 'groupdate'
gem 'rouge'
gem 'friendly_id', '~> 5.1.0'
gem 'client_side_validations'
gem 'country_select'
gem 'codemirror-rails'
gem 'rails-html-sanitizer', '~> 1.0.4'
gem 'meta-tags'

# performance
gem 'fast_blank'

# javascript
gem 'uglifier', '~> 4.1.10'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks', '~> 5.0.0'
gem 'lodash-rails'
gem 'browser'
gem 'coffee-rails'
gem 'webpacker', '~> 2.0'
gem 'paloma', '~> 5.1.0'
gem 'jbuilder'
gem 'jquery-atwho-rails'
gem 'social-share-button'

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
gem 'sidekiq', '~> 5.1.1'
gem "sidekiq-cron", "~> 0.6.3"
gem 'sidekiq-history'
gem 'sidekiq-failures'
gem 'sidekiq-unique-jobs'
gem 'sinatra', '~> 2.0.2', :require => nil

# images
gem 'carrierwave', '~> 1.0'
gem "remotipart"
gem 'net-ssh'
gem 'inline_svg'
gem 'file_validators'

# Amazon
gem 'aws-sdk', '~> 2.2'
gem 'fog'
#gem "aws-sdk-s3", require: false  # ActiveStorage

# View
gem "trailblazer"
gem "trailblazer-rails"
gem "cells-rails", git: 'https://github.com/trailblazer/cells-rails'
gem "cells"
gem "cells-erb"
gem 'record_tag_helper', '~> 1.0'
gem 'cookies_eu'


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
  gem 'meta_request'
  gem 'model_2_factory-rails'
  gem "lol_dba"
end

# Added to fix GitHub vulnerability messages
gem 'loofah', '~> 2.2.1'
gem 'sanitize', '~> 4.6.3'


group :development, :test do
  gem 'byebug'
  gem 'ffaker'
  gem 'spring'
  gem 'table_print'
  gem 'rspec-rails', '~> 3.6'
  gem 'rspec-kickstarter'
  gem 'parallel_tests'
  gem 'oauth2'
end

group :test do
  gem "factory_bot_rails"
  gem 'simplecov', :require => false
  gem 'capybara'
  gem 'capybara-email'
  gem 'capybara-screenshot'
  gem 'capybara-webkit', github: 'thoughtbot/capybara-webkit', branch: 'master'
  gem 'nokogiri' #, '~> 1.8'
  gem 'database_cleaner'
  gem "launchy"
  gem 'timecop'
  gem 'rails-controller-testing'
  gem 'pundit-matchers', git: 'https://github.com/crowdAI/pundit-matchers'
end
