source 'https://rubygems.org'

ruby "2.3.0"
gem 'rails', '4.2.3'
gem 'pg'
gem 'puma'


# user accounts / admin
gem 'devise'
gem "administrate", "~> 0.1.4"
gem 'pundit'

# monitoring
gem "rorvswild"
gem "skylight"
#gem 'newrelic_rpm'
#gem 'rollbar', '~> 2.8.3'

# model
gem 'simple_enum'
gem "schema_plus_views"
gem 'seed_dump'
gem 'validate_url'

# forms / data manipulation / charts
gem 'simple_form'
gem 'country_select'
#gem 'jquery-datatables-rails', :git => 'git://github.com/rweng/jquery-datatables-rails.git'
gem 'cocoon'
gem 'bootsy'
gem 'redcarpet'
gem 'groupdate'
#gem 'active_median'
#gem "chartkick"


# performance
gem 'fast_blank'

# javascript
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
#gem "jquery-fileupload-rails"
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'gon'
gem 'lodash-rails'

# css
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'include_media_rails'

# search / pagination
gem 'ransack'
gem 'kaminari'

# API
# gem 'rack-attack'
gem 'httparty'

# heroku / production
group :production, :staging do
  gem 'rails_12factor'
end
gem 'figaro'

# email
gem 'mandrill-api'

# background processing
gem 'sidekiq'
gem 'sidekiq-statistic'
gem 'sinatra', :require => nil


# static pages, sitemap
gem 'high_voltage', '~> 2.4.0'
#gem 'sitemap_generator'

# images
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem 'carrierwave'
gem 'net-ssh'

# Amazon
gem 'aws-sdk', '~> 2.2'
gem 'fog', '1.35.0'



group :development do
  gem 'guard'
  gem 'rails-footnotes', '>= 4.0.0', '<5'
  gem 'rails-erd'
  gem 'railroady'
  gem 'annotate'
  gem 'sdoc', '~> 0.4.0'
  gem 'web-console', '~> 2.0'
  gem 'scss_lint', require: false
end


group :development, :test do
  gem 'byebug'
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem 'faker'
  gem 'database_cleaner'
  gem 'simplecov', :require => false
  gem 'spring'
  gem 'shoulda'
  gem 'shoulda-matchers', require: false
  gem 'capybara'
  gem 'capybara-email'
  gem 'table_print'
  #gem 'regressor', git: 'https://github.com/ndea/regressor.git', branch: 'master'
end
