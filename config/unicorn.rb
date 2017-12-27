module Rails
  class <<self
    def root
      File.expand_path("../..", __FILE__)
    end
  end
end

worker_processes 2

working_directory Rails.root

listen "#{Rails.root}/tmp/sockets/unicorn.sock", :backlog => 64

listen 5001, :tcp_nopush => false

timeout 30

pid "#{Rails.root}/tmp/pids/unicorn.pid"

stderr_path "#{Rails.root}/log/unicorn.log"

stdout_path "#{Rails.root}/log/unicorn.log"

preload_app true

GC.respond_to?(:copy_on_write_friendly=) and

GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|

end