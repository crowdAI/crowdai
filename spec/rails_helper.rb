ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'spec_helper'
require 'pundit/matchers'
require 'rspec/rails'
require 'devise'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

Dir[File.dirname(__FILE__) + "/support/helpers/*.rb"]
  .each { |f| require f }
Dir[File.dirname(__FILE__) + "/support/matchers/*.rb"]
  .each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.server_port = 52508 + ENV['TEST_ENV_NUMBER'].to_i
Capybara.asset_host = 'http://localhost:3000'
Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  filename = File.basename(path)
  driver.browser.save_screenshot("#{Rails.root}/tmp/capybara/#{filename}")
end

RSpec.configure do |config|
  Capybara.reset_sessions!

  #config.filter_run :focus => true
  config.include FactoryBot::Syntax::Methods
  config.infer_spec_type_from_file_location!

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::ControllerHelpers, type: :helper
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Warden::Test::Helpers, type: :feature
  config.include ControllerSpecHelpers, type: :controller
  config.include HeaderHelpers
  config.include FeatureSpecHelpers, type: :feature

  Capybara.ignore_hidden_elements = true

  config.use_transactional_fixtures = false

  config.before(:suite) do
    FactoryBot.lint
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
