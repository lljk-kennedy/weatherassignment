#!/bin/bash
cd /var/www/
sudo chown -R ubuntu:ubuntu weatherassignment/
cd /var/www/weatherassignment 
/home/ubuntu/.rbenv/shims/bundle install --path vendor/bundle
#RAILS_ENV=development bundle exec rake db:migrate
# RAILS_ENV=development bundle exec rake assets:clobber
# RAILS_ENV=development bundle exec rake assets:precompile