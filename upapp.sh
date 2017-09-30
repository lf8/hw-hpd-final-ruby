#!/bin/sh
cd /opt/rubyfinal
echo 'deploy'
bundle install
bundle exec ruby application.rb
