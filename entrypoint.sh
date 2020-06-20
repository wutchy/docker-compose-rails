#!/bin/bash
CONTAINER_ALREADY_STARTED="container_existed"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
  touch $CONTAINER_ALREADY_STARTED
  echo "-- First container startup --"
  # YOUR_JUST_ONCE_LOGIC_HERE
  bundle init && \
  echo "gem 'rails', '~> 6.0', '>= 6.0.2'" >> Gemfile && \
  bundle install && \
  rails new . --force --database=mysql --skip-bundle --skip-webpack-install && \
  bundle install && \
  rails webpacker:install && \
  rails s -b 0.0.0.0 -p 3000
else
  echo "-- Not first container startup --"
  rm -f tmp/pids/server.pid
  bundle install
  rails s -b 0.0.0.0 -p 3000
fi
