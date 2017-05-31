#!/bin/sh
cd /var/www/
sudo chown -R ubuntu:ubuntu weatherassignment/
cd /var/www/weatherassignment/
/home/ubuntu/.rvm/gems/ruby-2.4.0/wrappers/rails server -d -p 3000 -b 0.0.0.0 --dev-caching 