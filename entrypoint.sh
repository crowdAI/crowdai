#!/bin/sh

cd /app &&
rm -f tmp/pids/server.pid &&
bundle exec rails webpacker:compile
bundle exec puma -C config/puma.rb
rails s -b '0.0.0.0'

