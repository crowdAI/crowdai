source 'https://rubygems.org'
gem 'rails-assets-isInViewport', source: 'https://rails-assets.org'
gem 'rails-assets-jQuery-File-Upload', source: 'https://rails-assets.org'

ruby "2.3.3"
gem 'rails', '5.0.0.1'
gem 'pg'
gem 'puma'
gem 'puma_worker_killer'


# user accounts / admin
gem 'devise'
gem 'pundit'
gem 'activeadmin', github: 'activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'active_admin_datetimepicker'
gem 'activeadmin-xls', github: 'thambley/activeadmin-xls'

# monitoring
gem "rorvswild"
#gem "brakeman", :require => false
gem 'mini_magick'

# model
gem 'simple_enum'
gem 'scenic', '~> 1.3'
gem 'seed_dump'
gem 'validate_url'
gem 'paper_trail'


# forms / data manipulation / charts
gem 'simple_form'
gem 'country_select'
gem 'cocoon'
gem 'redcarpet', '~> 3.4.0'
gem 'groupdate'
gem 'rouge'
gem 'friendly_id', '~> 5.1.0'
gem "rectify"
gem 'client_side_validations'

# performance
gem 'fast_blank'

# javascript
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
#gem 'jquery-ui-rails'
#gem "jquery-fileupload-rails"
gem 'turbolinks', '~> 5.0.0'
gem 'lodash-rails'
gem 'browser'
gem 'coffee-rails'


# css
gem 'sass-rails'
gem 'compass-rails'
gem 'momentjs-rails', '~> 2.9'

gem 'font-awesome-rails'
gem 'include_media_rails'

# search / pagination
gem 'ransack'
gem 'kaminari'
#gem 'searchkick'

# API / Docker
# gem 'rack-attack'
gem 'httparty'
gem 'excon'
gem 'docker-api'

# heroku / production
gem 'figaro'

# email
gem 'mandrill-api'
gem 'gibbon'

# background processing
gem 'sidekiq'
gem 'sidekiq-statistic'
gem 'sinatra', :require => nil


# static pages, sitemap
#gem 'sitemap_generator'

# images
gem 'carrierwave', '~> 1.0'
gem 'net-ssh'
gem 'inline_svg'

# Amazon
gem 'aws-sdk', '~> 2.2'
gem 'fog'

# View
gem "trailblazer"
gem "trailblazer-rails"
gem "cells-rails"
gem "cells"
gem "cells-erb"
gem "faraday"

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
  gem 'guard'
  gem 'rails-erd'
  gem 'railroady'
  gem 'annotate'
  gem 'sdoc', '~> 0.4.0'
  gem 'web-console', '~> 2.0'
  gem 'scss_lint', require: false
  gem 'shog', branch: 'master'
  gem 'rubocop', require: false
  gem 'meta_request'
end


group :development, :test do
  gem 'byebug'
  gem 'ffaker'
  gem 'spring'
  gem 'table_print'
  gem 'rspec-rails', '~> 3.5'
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
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem "launchy"
  gem 'shoulda'
  gem 'timecop'
  gem 'shoulda-matchers', require: false
  gem 'sanitize'
  gem 'rails-controller-testing'
  gem 'pundit-matchers', github: 'crowdAI/pundit-matchers', branch: 'participants'
end

gem "rack-timeout"
