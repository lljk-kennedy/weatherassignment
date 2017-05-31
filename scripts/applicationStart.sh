#!/bin/sh
cd /var/www/
sudo chown -R ec2-user:ec2-user weatherassignment/
cd /var/www/weatherassignment/
/home/ec2-user/.rvm/gems/ruby-2.4.0/wrappers/rails server -d -p 3000 -b 0.0.0.0 --dev-caching 