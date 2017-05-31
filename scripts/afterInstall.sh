#!/bin/bash
cd /var/www/weatherassignment
bundle install 
bin/rails db:migrate RAILS_ENV=development
# RAILS_ENV=development bundle exec rake assets:clobber
# RAILS_ENV=development bundle exec rake assets:precompile