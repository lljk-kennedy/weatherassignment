#!/bin/sh
cd /var/www/
sudo chown -R ubuntu:ubuntu weatherassignment/
cd /var/www/weatherassignment/
bundle install 
/home/ubuntu/.rbenv/shims/rails server -d -p 3000 -b 0.0.0.0 --dev-caching 