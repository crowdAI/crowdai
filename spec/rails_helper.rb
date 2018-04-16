ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'spec_helper'
require 'pundit/matchers'
require 'rspec/rails'
require 'devise'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'support/controller_helpers'
require 'features/support/feature_spec_helpers'
require 'support/helpers/header_helpers'
require 'simplecov'

ActiveRecord::Migration.maintain_test_schema!

Capybara.asset_host = 'http://localhost:3001'
Capybara.javascript_driver = :webkit
Capybara.server_port = 52508  # port registered with Amazon S3 CORS config
Capybara.default_max_wait_time = 5
Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  filename = File.basename(path)
  driver.browser.save_screenshot("#{Rails.root}/tmp/capybara/#{filename}")
end
Capybara::Webkit.configure do |config|
  config.allow_url("cdn.mathjax.org")
  config.allow_url("www.gravatar.com")
end

Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
  config.ignore_ssl_errors
end

RSpec.configure do |config|
  Capybara.reset_sessions!

  #config.filter_run :focus => true
  config.include FactoryGirl::Syntax::Methods
  config.infer_spec_type_from_file_location!

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::ControllerHelpers, type: :helper
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Warden::Test::Helpers, type: :feature

  Capybara.ignore_hidden_elements = true

  config.include ControllerHelpers, type: :controller
  config.include HeaderHelpers

  config.include FeatureSpecHelpers, type: :feature

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # Fixes Timecop’s issue (https://goo.gl/1tujRj)
  #config.around(:each, freeze_time: true) do |example|
  #  Timecop.freeze(Time.zone.now.change(nsec: 0))
  #  example.run
  #  Timecop.return
  #end

  config.example_status_persistence_file_path = 'spec/examples.txt'
end
