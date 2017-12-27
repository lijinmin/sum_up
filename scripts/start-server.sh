#!/bin/bash

cd /webapps/app
source /etc/profile.d/rvm.sh
mkdir -p /webapps/shared/pids
mkdir -p /webapps/shared/log
cat /webapps/shared/pids/unicorn.pid
kill -QUIT `cat /webapps/shared/pids/unicorn.pid`
rake db:create
rake db:migrate
bundle exec unicorn_rails -c config/unicorn.rb -E development