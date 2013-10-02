require 'rake'
require 'rake/testtask'
require 'rdoc/task'

namespace :nppes do
  desc 'Start background env'
  task :start_background_env do
    `RAILS_ENV=#{ENV['RAILS_ENV'] || 'development'} #{Rails.root.join('bin', 'delayed_job')} start`
  end

  desc 'Stop background env'
  task :stop_background_env do
    `RAILS_ENV=#{ENV['RAILS_ENV'] || 'development'} #{Rails.root.join('bin', 'delayed_job')} stop`
  end
end
