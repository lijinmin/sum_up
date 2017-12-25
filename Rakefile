# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
namespace :docker do  
  desc "Remove docker container"
  task :clean do
    sh './clean.sh'
  end
  desc "Build Docker image"
  task :build => [:clean] do
    sh './build.sh'
  end
  desc "Deploy Docker image"
  task :deploy => [:build] do
    sh './deploy.sh'
  end
end  