#!/usr/bin/env ruby
pid = File.open("tmp/pids/server.pid").readlines.join.strip

puts `sudo kill -9 #{pid}`

`rails s -d`