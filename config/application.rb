require_relative 'boot'

require 'rails/all'
require "active_storage/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Crowdai
  DATE_FORMAT = '%d %B %Y'

  class Application < Rails::Application
    config.load_defaults 5.2
    config.action_controller.default_protect_from_forgery = false

    config.assets.version = '2.0'

    config.active_job.queue_adapter = :sidekiq
    config.secret_key_base = ENV["SECRET_KEY_BASE"]
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths += Dir["#{Rails.root.to_s}/app/models/**/"]
    config.autoload_paths += Dir["#{Rails.root.to_s}/app/queries/**/"]
    config.active_record.time_zone_aware_types = [:datetime]
    config.ssl_options = { hsts: { subdomains: false } }
    config.assets.precompile += %w( application.scss )

    config.action_view.sanitized_allowed_tags =
      Set.new(%w(strong em b i p code pre tt samp kbd var sub
        sup dfn cite big small address hr br div span h1 h2 h3 h4 h5 h6 ul ol li dl dt dd abbr
        acronym a img blockquote del ins table tr td))

    config.generators do |g|
      g.test_framework :rspec
      g.stylesheets false
      g.helper false
      g.assets false
      g.view false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    config.to_prepare do
      Doorkeeper::ApplicationsController.layout "application"
      Doorkeeper::AuthorizationsController.layout "application"
      Doorkeeper::AuthorizedApplicationsController.layout "application"
    end
  end
end
