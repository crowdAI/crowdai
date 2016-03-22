# THIS FILE IS FOUND WITHIN config/initializers/mandrill.rb
require 'mandrill'

# Use an environment variable instead of placing the key in source code
MANDRILL = Mandrill::API.new ENV['MANDRILL_KEY']
