require 'mandrill'

MANDRILL = Mandrill::API.new ENV['MANDRILL_KEY']
