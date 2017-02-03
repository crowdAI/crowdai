source 'https://rubygems.org'

ruby "2.3.1"
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
#gem 'blazer'

# monitoring
gem "rorvswild"
#gem "skylight"
#gem "brakeman", :require => false

# trailblazer
#gem 'trailblazer-rails'



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



# performance
gem 'fast_blank'

# javascript
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem "gon"
#gem "jquery-fileupload-rails"
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'lodash-rails'
gem 'browser'
gem 'coffee-rails'


# css
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'momentjs-rails', '~> 2.9'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.42'


gem 'font-awesome-rails'
gem 'include_media_rails'

# search / pagination
gem 'ransack'
gem 'kaminari'

# API / Docker
# gem 'rack-attack'
gem 'httparty'
gem 'excon'
gem 'docker-api'

# heroku / production
group :production, :staging do
  gem 'rails_12factor'
end
gem 'figaro'

# email
gem 'mandrill-api'
gem 'gibbon'

# background processing
gem 'sidekiq'
gem 'sidekiq-statistic'
gem 'sidetiq'
gem 'sinatra', :require => nil


# static pages, sitemap
gem 'high_voltage'
#gem 'sitemap_generator'

# images
gem "paperclip", "~> 5.0.0"
gem 'carrierwave'
gem 'net-ssh'
gem 'inline_svg'

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
  gem 'shog', branch: 'master'
  gem 'rubocop', require: false
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
end
