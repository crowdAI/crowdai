ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
#require 'webmock/minitest'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new(color: true)

class ActiveSupport::TestCase
  #fixtures :all
  fixtures :articles, :article_sections, :participants, :organizers, :blogs
end
