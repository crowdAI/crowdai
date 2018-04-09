#!/bin/sh

cd /app &&
rm -f tmp/pids/server.pid &&
bundle exec rails webpacker:compile
bundle exec puma -C config/puma.rb
