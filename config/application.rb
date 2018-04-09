require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Crowdai
  DATE_FORMAT = '%d %B %Y'

  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.version = '1.0'

    config.active_job.queue_adapter = :sidekiq
    #config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]
    config.secret_key_base = ENV["SECRET_KEY_BASE"]
    #config.action_controller.default_url_options = {:host => ENV['HOST']}
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths += Dir["#{Rails.root.to_s}/app/models/**/"]
    config.autoload_paths += Dir["#{Rails.root.to_s}/app/queries/**/"]
    config.active_record.time_zone_aware_types = [:datetime]
    config.assets.precompile += %w( application.scss )


    config.generators do |g|
      g.test_framework :rspec
      g.stylesheets false
      g.helper false
      g.assets false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
